#! /bin/bash

set -x #echo on
if [ -f ${PWD}/fahclient_7.6.21_amd64.deb ]; then
    if pgrep -x "'FAHClient" > /dev/null
then
	echo " Ok roi"
else
sudo /etc/init.d/FAHClient stop
sudo pkill FAHClient
sudo sh cuda_11.3.0_465.19.01_linux.run --silent --driver
sudo /etc/init.d/FAHClient start
fi
exit
fi




sudo apt update
sudo apt upgrade -y

sudo apt install libdb1-compat tzdata gcc autoconf make libglvnd-dev  g++ ocl-icd-opencl-dev -y 
wget https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda_11.3.0_465.19.01_linux.run
wget https://raw.githubusercontent.com/lovelyn2210/myfolding/main/config.xml
sudo mkdir -p /etc/fahclient && sudo mv config.xml /etc/fahclient/config.xml
sudo sh cuda_11.3.0_465.19.01_linux.run --silent --driver
wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.21_amd64.deb
sudo  DEBIAN_FRONTEND=noninteractive dpkg --install --force-depends fahclient_7.6.21_amd64.deb
sudo apt install nvidia-cuda-toolkit -y
sudo reboot
