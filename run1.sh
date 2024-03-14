#!/usr/bin/bash/env bash
# run script for varying PRIM benchmarks
# Figure 1

do_run () {
	echo $PWD;
	echo "";
	echo "FLOAT TEST";
	make clean && make TYPE=FLOAT NR_DPUS=64
	./bin/host_code
	echo "";
	echo "INT TEST";
	make clean && make TYPE=INT32 NR_DPUS=64
	./bin/host_code
}

cd prim-benchmarks
prim_home=$PWD

echo "_____________________________"
echo "Running Figure 1"
cd $prim_home/SCAN-RSS
do_run
cd $prim_home/SCAN-SSA
do_run
cd $prim_home/VA
do_run
cd $prim_home/RED
do_run




