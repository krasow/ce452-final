#!/usr/bin/bash/env bash
# run script for individual operator timings
# Figure 3

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

cd operator_test
prim_home=$PWD

echo "_____________________________"
echo "Running Figure 3"
do_run




