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

wget https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda_11.3.0_465.19.01_linux.run
sudo apt install libdb1-compat tzdata gcc autoconf make libglvnd-dev  g++ ocl-icd-opencl-dev -y 
wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.21_amd64.deb
wget https://raw.githubusercontent.com/lovelyn2210/myfolding/main/config.xml
sudo mkdir -p /etc/fahclient && sudo mv config.xml /etc/fahclient/config.xml
sudo  DEBIAN_FRONTEND=noninteractive dpkg --install --force-depends fahclient_7.6.21_amd64.deb
sudo sh cuda_11.3.0_465.19.01_linux.run --silent
sudo reboot
