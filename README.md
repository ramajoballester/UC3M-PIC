# UC3M-PIC

Computer Vision class material for Master in Robotics and Automation at UC3M

# Installation

Refer to the installation guide for your OS

## Install pytorch 2.0 and its dependencies

Follow Pytorch official [installation guide](https://pytorch.org/get-started/locally/).
Installation with conda is highly recommended:

```conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia```
```conda activate pic```

## Install uc3m_pic package

Clone this repo in your working directory:

```git clone https://github.com/ramajoballester/UC3M-PIC.git```

And install it:

```pip install .```

To check everything is working, run:

```python -m unittest```


# Usage

Do not forget to run `wandb login` before starting the kernels of notebooks 02 and 03
