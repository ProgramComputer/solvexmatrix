#!/bin/sh
apt update && apt -y upgrade && apt -y install wget curl python-is-python3
apt install -y gnat 
cd ~
mkdir Downloads
apt update
apt install curl build-essential
cd ~/Downloads
pwd
curl -L 'https://www.davidhbailey.com/dhbsoftware/qd-2.3.23.tar.gz' >qd.tar.gz
tar zxvf qd.tar.gz
rm -rf qd.tar.gz
cd qd-2.3.23
./configure CXX=/usr/bin/g++ CXXFLAGS="-fPIC -O3"
make
make install
cd ..
wget http://www.math.uic.edu/~jan/PHCv2_4p.tar.gz
tar zxvf PHCv2_4p.tar.gz
rm -rf PHCv2_4p.tar.gz
wget http://mirrors.mit.edu/sage/linux/64bit/sage-9.4-Debian_GNU_Linux_11-x86_64.tar.bz2
tar -xjf sage-9.4-Debian_GNU_Linux_11-x86_64.tar.bz2
rm -rf sage-9.4-Debian_GNU_Linux_11-x86_64.tar.bz2
cd SageMath
./sage
ln -s ~/Downloads/SageMath/sage /usr/local/bin/sage
jupyter kernelspec install ~/Downloads/SageMath/local/share/jupyter/kernels/sagemath
mv -f /solvex/makefile_unix ~/Downloads/PHCv2_4p/Objects
mv -f /solvex/index.html.j2 /usr/local/share/jupyter/voila/templates/lab
mv -f /solvex/favicons /usr/local/share/jupyter/voila/templates/base/static
cd ~/Downloads/PHCv2_4p/Objects
make phcpy2c3.so
cd ~/Downloads/PHCv2_4p/Python/PHCpy3
python3 setup.py install
cd ~/Downloads/SageMath/local/lib/python3.9
cp -R /usr/local/lib/python3.9/dist-packages ./site-packages
cd site-packages
cp -R dist-packages/* .
rm -R dist-packages

