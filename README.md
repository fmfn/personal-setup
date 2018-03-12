# Setting up Deeplearning on Ubuntu 14.04 Server with a GTX 1080

This repository contains the necessary steps to get a working deeplearning
environment with CUDA-8-rc on ubuntu 14.04 server with a GTX 1080. As of July,
 2016, CUDA-8 is not yet released and the GTX 1080 requires it to run properly.
 So, in order to orchestrate drivers, CUDA, CuDNN, and ubuntu to work together,
 a slightly convoluted back and forth is necessary. Hopefully this guide
 provides all the necessary tools, and it should be obsolete mid August 2016,
 when CUDA-8 is released.

1. Install ubuntu, **boot in recovery mode than resume boot**, this will make it such
that the default graphic drivers are not initialized (the default graphics driver will
fail when booting with the GTX 1080). If your motherboard has a iGPU, you may
want to install ubuntu and perform the first boot with it.
2. Install git and clone the repo to get started:
  ```
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install -y git
  git clone https://github.com/fmfn/ubuntu-gpu-setup.git
  ```

3. Run the following commands:
  ```
  cd ubuntu-gpu-setup
  bash setup_0.sh
  bash setup_CUDA_CUDNN_run.sh
  ```
  Once the system is back up (might have to boot in recovery mode), continue
  with:
  ```
  cd ubuntu-gpu-setup
  bash setup_1.sh
  ```
  This should install CUDA, CuDNN, with the appropriate driver for the GTX 1080.
  Make sure the installation was successful by checking nvcc is installed with:
  ```
  which nvcc
  ```
  and that the graphics card is being detected properly and the correct version
  of the driver (367-35) is installed with:
  ```
  nvidia-smi
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

7. Mount sdb2 for that extra storage space!
  - Use `lsblk` to see all disks
  - Follow this [tutorial](http://www.thegeekstuff.com/2012/08/2tb-gtp-parted/)
  to mount a partition over 2TB. Basically run:
    - `parted /dev/sdb`
    - `mklabel gpt`
    - `mkpart primary 0GB <size>GB`
    - `mkfs /dev/sdb1`
    - `mkdir /data`
    - `mount /dev/sdb1 /data`
    - `df -h`
  - Give write access to non-sudo users
    - `cd /data`
    - `sudo chmod -R -v 777 *`

# Updating CUDA
To update CUDA in a system that is already working follow these steps:

1. Download the newest driver for your video card and install it (it is a `.run` file, follow the directions in setup step 1 in this repo).
2. Download the new CUDA `.run` file. Once finished run: `sudo sh cuda_{version-number}.run` **Remember to NOT install drivers!**
3. Update the following environment variables:
    - Copy and paste `echo $PATH`
    - Change the cuda version `...:/usr/local/cuda-8.0/bin:...` --> `...:/usr/local/cuda-9.1/bin:...`
    - Export the entire `PATH`.
    - Do the same with `LD_LIBRARY_PATH`.
    - Alternatively try these two steps
        - export PATH=/usr/local/cuda-9.1/bin${PATH:+:${PATH}}
        - export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64\
4. `sudo reboot`
