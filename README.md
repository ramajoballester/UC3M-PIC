# UC3M-PIC

Computer Vision class material for Master in Robotics and Automation at UC3M

# Installation

## Install anaconda / miniconda

## Create conda environment

```conda create -n pic python=3.9.*```

## Install pytorch 2.0 and its dependencies

Follow Pytorch official [installation guide](https://pytorch.org/get-started/locally/).
Installation with conda is highly recommended:

```conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia```
```conda activate pic```

## Install uc3m_pic package


Forward port 8157


## Install GCloud CLI

[GCloud CLI](https://cloud.google.com/sdk/docs/install)

Set up credentials

[Setup](https://cloud.google.com/docs/authentication/provide-credentials-adc)

```
gcloud auth application-default login
gcloud auth application-default revoke
```


# Ideas 

- Zero initialization
- Input normalization
