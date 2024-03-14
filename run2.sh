#!/usr/bin/bash/env bash
# run script for stuff

do_run () {
	echo $PWD;
	echo "";
	echo "FLOAT TEST";
	make clean && make TYPE=FLOAT NR_DPUS=1
	./bin/host_code
	echo "";
	echo "INT TEST";
	make clean && make TYPE=INT32 NR_DPUS=1
	./bin/host_code
}

cd elementwise_test
element=$PWD

echo "_____________________________"
echo "Running Figure 2"
cd $element/VA
do_run
cd $element/VS
do_run
cd $element/VMULT
do_run
cd $element/VDIVD
do_run




