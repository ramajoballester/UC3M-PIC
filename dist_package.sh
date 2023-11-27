python -m build packages/ --sdist
python -m build packages/ --wheel
twine check packages/dist/*
python -m twine upload packages/dist/*