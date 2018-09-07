#!/bin/bash

cd ~
mkdir go
go env GOPATH # should return /home/username/go
echo "export GOPATH=\$(go env GOPATH)" >> ~/.bashrc
echo "export PATH=\$PATH:\$(go env GOPATH)/bin" >> ~/.bashrc

