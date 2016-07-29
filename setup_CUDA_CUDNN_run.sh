mkdir CUDA
cd CUDA

echo "WILL NOW DOWNLOAD CUDA AND CUDNN, THIS MIGHT TAKE A WHILE..."
wget https://dl.dropboxusercontent.com/u/5268799/ubuntu1404-cuda8-cudnn5.zip
unzip ubuntu1404-cuda8-cudnn5.zip

sudo sh cuda_8.0.27_linux.run

tar zxvf cudnn-8.0-linux-x64-v5.0-ga.tgz
cd cuda

CUDA_LONG_PATH="$(which nvcc)"
CUDA_PATH="$(echo $CUDA_LONG_PATH | cut -d'/' -f-4)"

sudo cp include/cudnn.h $CUDA_PATH/include
sudo cp lib64/libcudnn* $CUDA_PATH/lib64
sudo chmod a+r $CUDA_PATH/lib64/libcudnn*

sudo reboot
