
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <dpu.h>
#include <dpu_log.h>
#include <unistd.h>
#include <getopt.h>
#include <assert.h>


// Define the DPU Binary path as DPU_BINARY here
#ifndef DPU_BINARY
#define DPU_BINARY "./bin/dpu_code"
#endif

// dpu specific 
#include <dpu.h>

int main(void) {
	struct dpu_set_t dpu_set, dpu;
	uint32_t nr_of_dpus;

	DPU_ASSERT(dpu_alloc(NR_DPUS, "backend=simulator", &dpu_set));
	DPU_ASSERT(dpu_load(dpu_set, DPU_BINARY, NULL));

	DPU_ASSERT(dpu_get_nr_dpus(dpu_set, &nr_of_dpus));


	uint32_t nb_perf = 0;
	uint32_t nb_perf_total = 0;
	uint32_t clocks_per_sec = 0;


	DPU_ASSERT(dpu_launch(dpu_set, DPU_SYNCHRONOUS));


	DPU_FOREACH(dpu_set, dpu) {
			DPU_ASSERT(dpu_copy_from(dpu, "nb_perf", 0, &nb_perf, sizeof(uint32_t)));
			nb_perf_total += nb_perf;
	}
	// retrieve DPU frequency
	DPU_FOREACH(dpu_set, dpu) {
			DPU_ASSERT(dpu_copy_from(dpu, "CLOCKS_PER_SEC", 0, &clocks_per_sec, sizeof(uint32_t)));
	}

	int ins_per_dpu = nb_perf_total / nr_of_dpus;  
	double dpu_time = ((double) ins_per_dpu / clocks_per_sec) * 1000;
	
	printf("operator took %d ins and %f seconds\n", ins_per_dpu, dpu_time);
}
