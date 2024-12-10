#include <cuda_runtime.h>
#include "kernel.cuh"

__global__ void vectorAdd(const float* A, const float* B, float* C, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        C[idx] = A[idx] + B[idx];
    }
}

__global__ void computeKernel(float *d_data, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        float x = d_data[idx];
        for(int i = 0; i < 100; i++) {
            x = x * x + 1.0f;
        }
        d_data[idx] = x;
    }
}

__global__ void memoryKernel(float *d_in, float *d_out, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        d_out[idx] = d_in[idx];
    }
} 