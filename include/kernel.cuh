#pragma once

// Basic vector addition kernel
__global__ void vectorAdd(const float* A, const float* B, float* C, int N);

// Compute performance test kernel
__global__ void computeKernel(float *d_data, int n);

// Memory bandwidth test kernel
__global__ void memoryKernel(float *d_in, float *d_out, int n);