#include <stdint.h>
#include <stdio.h>
#include <defs.h>
#include <mram.h>
#include <alloc.h>
#include <mram.h>
#include <barrier.h>
#include <perfcounter.h>

__host uint32_t nb_perf;


BARRIER_INIT(my_barrier, NR_TASKLETS);

int main(void) {
	uint16_t tasklet_id = me();

    if (tasklet_id == 0) { // Initialize once the cycle counter
        mem_reset(); // Reset the heap
    }
	
	uint32_t mram_base_addr     = (uint32_t) DPU_MRAM_HEAP_POINTER;	
	
#ifdef FLOAT
	volatile float a = 3.231;
	volatile float b = 13.495;
	volatile float res;
#else 
    volatile int a = 3;
	volatile int b = 13;
	volatile int res;
#endif

	perfcounter_config(COUNT_INSTRUCTIONS, true);
#ifdef ADDITION
	res = a + b;
#endif
#ifdef SUBTRACTION
	res = a - b;
#endif
#ifdef MULT
	res = a * b;
#endif
#ifdef DIV
	res = a / b;
#endif
	nb_perf = perfcounter_get();
	

	if (tasklet_id == 0){
		mram_write((void *)&res, (__mram_ptr void*)mram_base_addr, 8);
	}
	
	barrier_wait(&my_barrier);
	return 0;
}
