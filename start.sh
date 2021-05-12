#! /bin/bash

set -x #echo on
if [ -f ${PWD}/fahclient_7.6.21_amd64.deb ]; then
    if pgrep -x "'FAHClient" > /dev/null
then
	echo " Ok roi"
else

sudo tmux new-session -d -s my_session1  'FAHClient --user=fne01qkr5bye --team=234980 --passkey=f1ca7bc9170c9d35f1ca7bc9170c9d35 --gpu=true --smp=true'
fi
exit
fi




sudo apt update
sudo apt upgrade -y

sudo apt install libdb1-compat tzdata gcc autoconf make libglvnd-dev  g++ ocl-icd-opencl-dev -y 
CUDA_REPO_PKG=cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG} 

sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub 
rm -f /tmp/${CUDA_REPO_PKG}

sudo apt-get update
sudo apt-get install cuda-drivers -y 
sudo apt-get install cuda -y 
wget https://raw.githubusercontent.com/lovelyn2210/myfolding/main/config.xml
sudo mkdir -p /etc/fahclient && sudo mv config.xml /etc/fahclient/config.xml
wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.21_amd64.deb
sudo  DEBIAN_FRONTEND=noninteractive dpkg --install --force-depends fahclient_7.6.21_amd64.deb
sudo apt install nvidia-cuda-toolkit -y
sudo reboot
