#include <cuda_runtime.h>
#include <stdio.h>
#include "benchmark.cu"

int main() {
    // Print device properties
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    printf("Device: %s\n", prop.name);
    printf("Compute capability: %d.%d\n", prop.major, prop.minor);
    
    // Run benchmarks with different sizes
    int sizes[] = {1000000, 10000000, 100000000};
    
    for (int size : sizes) {
        printf("\nRunning benchmark with size %d\n", size);
        CudaBenchmark benchmark(size);
        benchmark.runBenchmark();
    }

    return 0;
} 