# First argument is new commit name for the public repo

export tmp_dir=.tmp_clone
export syncignore=.syncignore

# Check if the .tmp_clone folder exists. If it does, abort. Else, create directory and do the sync
if [ -d "$tmp_dir" ]; then
    echo "Directory $tmp_dir already exists. Aborted"
    exit 1
else
    mkdir $tmp_dir
fi

# Clone the public repo
cd $tmp_dir
git clone git@github.com:ramajoballester/UC3M-PIC.git
cd UC3M-PIC

git remote -v
git remote add private git@github.com:ramajoballester/UC3M-PIC.private.git
git checkout -b filter
git fetch private
# git pull -f private main
git reset --hard private/main
# Remove all commits (or parts of them that contain files in the .syncignore file)
git filter-repo --paths-from-file "./$syncignore" --invert-paths --force

# Echo every line in the .syncignore file
while IFS= read -r line; do
    echo "Removed $line"
done < "./$syncignore"

# Previous command shows

# Remove all the cells with the text "SOLUTION" in the notebooks
printf "\nRemoving all the cells with the text \"SOLUTION\" in the notebooks\n"
# git filter-repo --path notebooks/ --blob-callback '
git filter-repo --blob-callback '
import json
try:
    notebook = json.loads(blob.data)
    if "cells" in notebook:
        for cell in notebook["cells"]:
            if "source" in cell:
                if "SOLUCION" in cell["source"][0]:
                    cell["source"] = ["# SOLUCIÓN:\n"]
        blob.data = (json.dumps(notebook, ensure_ascii=False, indent=1,
                                sort_keys=True) + "\n").encode("utf-8")
except json.JSONDecodeError as ex:
    pass
except UnicodeDecodeError as ex:
    pass
except Exception as ex:
    pass
'

git reset --soft main
if [ -z "$1" ]
then
    git commit -m "Auto update"
    echo "Commit message: Auto update"
else
    git commit -m "$1"
    echo "Commit message: $1"
fi
git checkout main
git cherry-pick filter

git remote add origin git@github.com:ramajoballester/UC3M-PIC.git
git remote rm private
git push --set-upstream origin main

cd ../..
rm -rf $tmp_dir