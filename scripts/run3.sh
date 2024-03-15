#!/usr/bin/bash/env bash
# run script for individual operator timings
# Figure 3

do_run () {
	echo $PWD;
	echo "";
	echo "FLOAT TEST";
	make clean && make TYPE=FLOAT TEST=ADDITION NR_DPUS=1
	./bin/host_code
	make clean && make TYPE=FLOAT TEST=SUBTRACTION NR_DPUS=1
	./bin/host_code
	make clean && make TYPE=FLOAT TEST=MULT NR_DPUS=1
	./bin/host_code
	make clean && make TYPE=FLOAT TEST=DIV NR_DPUS=1
	./bin/host_code
	echo "";
	echo "INT TEST";
	make clean && make TYPE=INT32 TEST=ADDITION NR_DPUS=1
	./bin/host_code
	make clean && make TYPE=INT32 TEST=SUBTRACTION NR_DPUS=1
	./bin/host_code
	make clean && make TYPE=INT32 TEST=MULT NR_DPUS=1
	./bin/host_code
	make clean && make TYPE=INT32 TEST=DIV NR_DPUS=1
	./bin/host_code
}

cd operator_test
prim_home=$PWD

echo "_____________________________"
echo "Running Figure 3"
do_run




