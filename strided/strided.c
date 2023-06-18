////////////////////////////////////////////////////////////////////////////////
// Strided (vary array size, stride to map out cache capacity /access latency)
// Author: Christopher Celio
// Date  : 2011 Jan 15
// About : This code is based on lecture notes provided by Prof. Yelick in 
//         CS267. Ideally, this ubenchmark is inadequate for modern memory
//         hierarchies as prefetching (among other things) greatly obscure
//         the true cache capacities and access latencies. 
//
//
//        for array A of length L from 4KB to 8MB by 2x
//             for stride s from 4 Bytes (1 word) to L/2 by 2x
//                   time the following loop 
//                   (repeat many times and average)
//                   for i from 0 to L by s
//                      load A[i] from memory (4 Bytes)


// #define DEBUG 
// #define PRINT_ARRAY
// #define PRINT_SCRIPT_FRIENDLY

#ifdef USING_TILERA
#include <ilib.h>
#endif

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <firesim_triggers.h>


// Global Variables
uint32_t* g_array;
uint32_t  g_num_cores;
uint64_t  g_arr_size;
uint64_t  g_arr_stride;
uint64_t  g_num_iterations;
double const g_clk_freq = 2.33e9;


// Function Declarations
uint32_t threadMain();
uint32_t printArray(uint32_t iter);


int main(int argc, char* argv[])
{
#ifdef DEBUG  
  printf("\nBegin Test\n");
#endif

  if (argc != 5) 
  {
    fprintf(stderr, "argc=%d\n", argc);
    fprintf(stderr, "\n[Usage]: strided <Number of Threads> <Number of Array Elements (Total)> <Stride through Array(4B Word)> <Number of Iterations>\n\n");
    return 1;
  }

  g_num_cores      = atoi(argv[1]);
  g_arr_size       = atoll(argv[2]);
  g_arr_stride     = atoll(argv[3]);
  g_num_iterations = atoll(argv[4]);

  if (g_num_cores != 1)
  {
    return 2;
  }

#ifdef DEBUG
  printf("Number of Cores      = %d\n",  g_num_cores);
  printf("Size of the array    = %d\n",  g_arr_size);
  printf("Size of the stride   = %d\n",  g_arr_stride);
  printf("Number of Iterations = %d\n\n",g_num_iterations);
#endif


   g_array  = (uint32_t *) malloc((g_arr_size) * sizeof(uint32_t));

   //initialize to bring it into the cache 
   for (uint64_t i = 0; i < g_arr_size; i++)
   {
      g_array[i] = 1;
   }
  
   uint32_t volatile ret_val = threadMain();  

#ifdef DEBUG
  fprintf(stderr, "Done. Exiting...\n\n");
#endif

  return 0;
}


uint32_t threadMain()
{
   FIRESIM_START_TRIGGER;

   uint32_t sum = 0;

   for (uint64_t i = 0; i < g_num_iterations; i++)
   {
      //stride is in 4 byte chunks, so this works out just right
      sum += g_array[(i*g_arr_stride) % g_arr_size];
   }

   FIRESIM_END_TRIGGER;

  return sum; //prevent compiler from removing our work...
}

uint32_t printArray(uint32_t iter)
{
  fprintf(stderr, "Contents of Array after iteration: %d\n", iter);
  for (uint32_t i = 0; i < g_arr_size; i++)
  {
    fprintf(stderr, "%d ", g_array[i]);
  }
  fprintf(stderr, "\n\n");

  return 0;
}

