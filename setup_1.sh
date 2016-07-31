# Steps to install driver from ppa.
# sudo add-apt-repository ppa:graphics-drivers/ppa
# sudo apt-get update
# sudo apt-get install -y nvidia-367
# sudo shutdown -r now

echo ""
echo "*** WILL NOW DOWNLOAD AND INSTALL 367-35 DRIVER ***"
echo ""
wget https://dl.dropboxusercontent.com/u/5268799/NVIDIA-Linux-x86_64-367.35.run

# For Ubuntu LightDM [DEFAULT]
sudo service lightdm stop

#For Gnome GDM
sudo service gdm stop

# Install new driver!
sudo sh NVIDIA-Linux-x86_64-367.35.run

sudo reboot
