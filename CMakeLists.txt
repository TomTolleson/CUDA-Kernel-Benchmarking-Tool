cmake_minimum_required(VERSION 3.8)
project(cuda_benchmark CUDA CXX)

set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/include)

# Add executable
add_executable(benchmark 
    src/main.cu
    src/kernel.cu
    src/benchmark.cu
)

# Set CUDA architectures
set_target_properties(benchmark PROPERTIES
    CUDA_ARCHITECTURES native) 

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)