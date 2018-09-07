#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Run with sudo"
   exit 1
fi


cd /usr/local/src/
export GO_VERSION=1.11
wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz
tar -xvf go$GO_VERSION.linux-amd64.tar.gz
mv go /usr/local
ln -s /usr/local/go/bin/go /usr/bin
ln -s /usr/local/go/bin/godoc /usr/bin
ln -s /usr/local/go/bin/gofmt /usr/bin

