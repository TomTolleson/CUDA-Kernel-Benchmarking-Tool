#include <cuda_runtime.h>
#include <stdio.h>
#include "kernel.cuh"
#include "timer.hpp"

class CudaBenchmark {
private:
    int N;
    float *d_A, *d_B, *d_C;
    float *h_A, *h_B, *h_C;

public:
    CudaBenchmark(int size) : N(size) {
        // Allocate host memory
        h_A = new float[N];
        h_B = new float[N];
        h_C = new float[N];

        // Initialize data
        for(int i = 0; i < N; i++) {
            h_A[i] = rand() / (float)RAND_MAX;
            h_B[i] = rand() / (float)RAND_MAX;
        }

        // Allocate device memory
        cudaMalloc(&d_A, N * sizeof(float));
        cudaMalloc(&d_B, N * sizeof(float));
        cudaMalloc(&d_C, N * sizeof(float));
    }

    void runBenchmark() {
        Timer timer;
        
        // Copy inputs to device
        cudaMemcpy(d_A, h_A, N * sizeof(float), cudaMemcpyHostToDevice);
        cudaMemcpy(d_B, h_B, N * sizeof(float), cudaMemcpyHostToDevice);

        // Launch kernel
        int threadsPerBlock = 256;
        int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;
        
        timer.start();
        vectorAdd<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, N);
        timer.stop();

        // Copy result back to host
        cudaMemcpy(h_C, d_C, N * sizeof(float), cudaMemcpyDeviceToHost);
        
        printf("Kernel execution time: %f ms\n", timer.elapsedMilliseconds());
    }

    ~CudaBenchmark() {
        // Cleanup
        delete[] h_A;
        delete[] h_B;
        delete[] h_C;
        cudaFree(d_A);
        cudaFree(d_B);
        cudaFree(d_C);
    }
}; 