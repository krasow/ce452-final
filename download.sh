#!/bin/bash

# pre req of Ubuntu 22.04 x86
wget http://sdk-releases.upmem.com/2023.2.0/ubuntu_22.04/upmem-2023.2.0-Linux-x86_64.tar.gz
tar -xvf upmem-2023.2.0-Linux-x86_64.tar.gz
mv upmem-2023.2.0-Linux-x86_64 upmem
cd upmem
source upmem-env.sh simulator

git clone git@github.com:CMU-SAFARI/prim-benchmarks.git

