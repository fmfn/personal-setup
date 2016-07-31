sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y build-essential cmake g++ gfortran git htop wget unzip
sudo apt-get install -y gcc linux-image-generic libopenblas-dev liblapack-dev
sudo apt-get install -y libfreetype6-dev libpng-dev
sudo apt-get install -y pkg-config software-properties-common
sudo apt remove --purge nvidia*

# Python 2 setup, update this for python 3
sudo apt-get install -y python-dev python-pip python-nose python-numpy python-scipy

sudo apt-get autoremove
sudo rm -rf /var/lib/apt/lists/*
