#!/bin/bash
GOPATH="/root/go"
GOZIP="go1.12.8.linux-amd64.tar.gz"
if [ ! -d GOPATH ];then
    mkdir -p $GOPATH
fi
echo "RSAAuthentication yes" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
wget "https://dl.google.com/go/"$GOZIP
tar -C /usr/local -xzf $GOZIP
rm $GOZIP
if [ $? -ne 0 ]; then
    exit 1
fi
echo "GOPATH=/root/go" >> /root/.profile
echo "GOROOT=/usr/local/go" >> /root/.profile
echo "export PATH=$PATH:$GOPATH/bin:$GOROOT/bin" >> /root/.profile
source /root/.profile
