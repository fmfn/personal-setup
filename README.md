# Setting up Deeplearning on Ubuntu 14-04 Server with a GTX 1080

Step to get a working environment:

1. Install ubuntu, **boot in recovery mode than resume boot**, this will make it such
that the default graphic drivers are not initialized (the default graphics driver will
fail when booting with the GTX 1080).
2. Install git and clone the repo to get started:
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y git
git clone ...
```
3. Run the following commands:
```
cd ubuntu-gpu-setup
bash setup_0.sh
bash setup_CUDA_CUDNN_run.sh
```
4. Create a virtual environment:
```
bash setup_venv.sh
source ~/venvs/deeplearning/bin/activate
```
5. Install Keras (together with numpy and scipy) and add `.theanorc` to its
appropriate path.
```
bash theano-keras.sh
```
6. Install a number of important python packages.
```
bash python_packages.sh
bash dark_jupyter.sh
```
