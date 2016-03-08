#! /bin/bash
############################
# author:zuoa
# website:http://yuy.im
# version:0.1
############################

init_dir=/opt/init_install/
if [ ! -d "$init_dir" ];
then
    mkdir -p $init_dir
fi

yum update
yum install gcc openssl openssl-devel zlib-devel git -y

#update python
cd $init_dir
wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz --no-check-certificate
tar zvxf Python-2.7.11.tgz
cd Python-2.7.11
sed -i 's/#zlib/zlib/'  Modules/Setup.dist
./configure  && make && make install
mv /usr/bin/python /usr/bin/python_old
ln -s /usr/local/bin/python2.7 /usr/bin/python
sed -i 's/python/python_old/'  /usr/bin/yum

#install pip
cd $init_dir
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
