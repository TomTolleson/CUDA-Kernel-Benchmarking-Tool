# CUDA Kernel Benchmarking Tool

[![CUDA](https://img.shields.io/badge/CUDA-12.0-76B900?style=flat&logo=nvidia)](https://developer.nvidia.com/cuda-toolkit)
[![C++](https://img.shields.io/badge/C++-17-00599C?style=flat&logo=cplusplus)](https://isocpp.org/)
[![CMake](https://img.shields.io/badge/CMake-3.8+-064F8C?style=flat&logo=cmake)](https://cmake.org/)
[![VS Code](https://img.shields.io/badge/VS_Code-1.8+-007ACC?style=flat&logo=visualstudiocode)](https://code.visualstudio.com/)

A professional CUDA benchmarking tool for testing and measuring GPU kernel performance.

## Features


- Vector addition kernel benchmarking
- Compute performance testing
- Memory bandwidth testing
- High-precision timing measurements
- Configurable test sizes

## Requirements

- NVIDIA CUDA Toolkit
- C++17 compatible compiler
- CMake 3.8 or higher

## Building

```bash
mkdir build
cd build
cmake ..
make
```

## Usage

```bash
./benchmark
```

## Project Structure

- `src/` - Source files
- `include/` - Header files
- `build/` - Build directory
