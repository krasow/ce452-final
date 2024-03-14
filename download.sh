#!/usr/bin/bash/env bash 

# pre req of Ubuntu 22.04 x86

pd=$PWD
echo $pd

# get anaconda locally
mkdir -p $pd/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $pd/miniconda3/miniconda.sh
bash $pd/miniconda3/miniconda.sh -b -u -p $pd/miniconda3
rm -rf $pd/miniconda3/miniconda.sh
$pd/miniconda3/bin/conda init bash
conda env create -f environment.yml


wget http://sdk-releases.upmem.com/2023.2.0/ubuntu_22.04/upmem-2023.2.0-Linux-x86_64.tar.gz
tar -xvf upmem-2023.2.0-Linux-x86_64.tar.gz
mv upmem-2023.2.0-Linux-x86_64 upmem
cd $pd/upmem
source upmem_env.sh simulator

cd $pd
git clone git@github.com:CMU-SAFARI/prim-benchmarks.git

