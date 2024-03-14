#!/usr/bin/bash/env bash 

# pre req of Ubuntu 22.04 x86


# get anaconda locally
mkdir -p ./miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ./miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ./miniconda3/miniconda.sh
./miniconda3/bin/conda init bash
conda env create -f environment.yml


wget http://sdk-releases.upmem.com/2023.2.0/ubuntu_22.04/upmem-2023.2.0-Linux-x86_64.tar.gz
tar -xvf upmem-2023.2.0-Linux-x86_64.tar.gz
mv upmem-2023.2.0-Linux-x86_64 upmem
cd upmem
source upmem_env.sh simulator

cd ..
git clone git@github.com:CMU-SAFARI/prim-benchmarks.git

