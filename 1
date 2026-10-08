# CUDA Introduction

CUDA stands for **Compute Unified Device Architecture**. It is NVIDIA's platform and programming model for using **NVIDIA GPUs for general-purpose computation**, not just graphics.

If C, C++, Java, and Python are programming languages, CUDA is somewhat different: it is primarily a **GPU computing platform, programming model, compiler/toolchain, and software ecosystem**.

The simplest mental model is:

```text
CPU
 │
 ├── general-purpose computation
 │
 └── controls / coordinates
          │
          ▼
        CUDA
          │
          ▼
       NVIDIA GPU
          │
     ┌────┼────┐
     ▼    ▼    ▼
   CUDA CUDA CUDA
  threads threads threads
```

---

## 1. Why was CUDA created?

A CPU is designed to handle relatively complicated tasks with a small number of powerful cores.

A GPU is designed around **massive parallelism**.

Very roughly:

```text
CPU

┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐
│ Core  │ │ Core  │ │ Core  │ │ Core  │
└───────┘ └───────┘ └───────┘ └───────┘


GPU

┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ...
│ │ │ │ │ │ │ │ │ │ │ │ │ │ │ │
└─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘
        thousands of parallel
             execution units
```

This makes GPUs particularly effective for workloads where the same operation needs to be performed on a huge amount of data.

For example:

```text
C = A + B

C[0] = A[0] + B[0]
C[1] = A[1] + B[1]
C[2] = A[2] + B[2]
...
C[999999] = A[999999] + B[999999]
```

These operations can potentially be performed in parallel.

---

# 2. CUDA's history

NVIDIA introduced CUDA publicly in **2007**.

Before CUDA, GPUs were primarily associated with:

```text
3D graphics
   ↓
games
   ↓
graphics rendering
```

CUDA helped transform GPUs into general-purpose parallel computing devices:

```text
GPU
 │
 ├── graphics
 │
 └── general-purpose computing
          │
          ├── scientific computing
          ├── simulations
          ├── machine learning
          ├── deep learning
          ├── image processing
          └── AI
```

This became particularly important for modern AI.

---

# 3. CUDA is not exactly a programming language

This distinction is important.

You might hear:

> "CUDA programming language"

but technically CUDA is better understood as an **ecosystem/platform and programming model**.

It includes things such as:

```text
CUDA
 │
 ├── CUDA programming model
 ├── CUDA C/C++
 ├── nvcc compiler
 ├── CUDA runtime
 ├── CUDA libraries
 ├── CUDA Toolkit
 ├── GPU drivers
 └── development/debugging tools
```

CUDA programs are traditionally written using **C/C++ extensions**.

For example:

```cpp
__global__ void hello()
{
    // code executed on GPU
}
```

So CUDA is closely connected to C++.

---

# 4. CPU vs GPU

The fundamental difference is **parallelism**.

Imagine adding two arrays containing one million numbers.

### CPU approach

Conceptually:

```text
CPU
 │
 ├── calculate element 0
 ├── calculate element 1
 ├── calculate element 2
 ├── ...
 └── calculate element 999999
```

### GPU approach

Conceptually:

```text
GPU
 │
 ├── thread 0 → element 0
 ├── thread 1 → element 1
 ├── thread 2 → element 2
 ├── ...
 └── thread 999999 → element 999999
```

The actual hardware and scheduling are more complicated, but this is the fundamental idea.

---

# 5. CUDA programming model

CUDA introduces a hierarchy of parallel execution.

The important concepts are:

```text
Grid
 │
 └── Blocks
       │
       └── Threads
```

For example:

```text
Grid
│
├── Block 0
│    ├── Thread 0
│    ├── Thread 1
│    ├── Thread 2
│    └── ...
│
├── Block 1
│    ├── Thread 0
│    ├── Thread 1
│    └── ...
│
└── Block 2
     ├── Thread 0
     ├── Thread 1
     └── ...
```

A **thread** performs an individual piece of work.

A **block** groups threads that can cooperate.

A **grid** represents the complete set of blocks executing a kernel.

---

# 6. What is a CUDA kernel?

A **kernel** is a function that runs on the GPU.

For example:

```cpp
__global__ void add(int *a, int *b, int *c)
{
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}
```

The special keyword:

```cpp
__global__
```

means that this function is a CUDA kernel.

The CPU can launch it:

```cpp
add<<<1, 256>>>(a, b, c);
```

The syntax:

```text
<<<grid, block>>>
```

specifies the execution configuration.

---

# 7. A complete simplified example

Here's a small CUDA program:

```cpp
#include <stdio.h>

__global__ void add(int *a, int *b, int *c)
{
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}

int main()
{
    int a[3] = {1, 2, 3};
    int b[3] = {4, 5, 6};
    int c[3];

    // GPU memory allocation and copying omitted here

    add<<<1, 3>>>(a, b, c);

    // Copy result back to CPU omitted here
}
```

Conceptually:

```text
CPU
 │
 │ launch
 ▼
GPU
 │
 ├── thread 0: 1 + 4 = 5
 ├── thread 1: 2 + 5 = 7
 └── thread 2: 3 + 6 = 9
```

The result is:

```text
[5, 7, 9]
```

---

# 8. CPU memory vs GPU memory

One of the most important CUDA concepts is that the CPU and GPU have different memory spaces.

Simplified:

```text
             Computer
                │
       ┌────────┴────────┐
       │                 │
      CPU               GPU
       │                 │
   CPU memory        GPU memory
       │                 │
       └───────┬─────────┘
               │
          data transfer
```

The program may need to:

```text
CPU memory
    │
    │ copy
    ▼
GPU memory
    │
    │ GPU computation
    ▼
GPU memory
    │
    │ copy
    ▼
CPU memory
```

This transfer has a cost.

Therefore, CUDA programs often try to:

> **Keep data on the GPU as long as possible.**

---

# 9. CUDA memory hierarchy

CUDA exposes several types of GPU memory.

A simplified hierarchy is:

```text
GPU
 │
 ├── Registers
 │      ↓ very fast
 │
 ├── Shared memory
 │
 ├── L1 / L2 cache
 │
 └── Global memory
        ↓ larger, slower
```

Different types have different performance characteristics.

This becomes important when optimizing CUDA programs.

---

# 10. Threads, blocks and SMs

The GPU hardware contains **Streaming Multiprocessors (SMs)**.

Conceptually:

```text
GPU
│
├── SM 0
│    ├── threads
│    ├── registers
│    └── shared memory
│
├── SM 1
│    ├── threads
│    ├── registers
│    └── shared memory
│
├── SM 2
│    └── ...
│
└── ...
```

CUDA blocks are scheduled onto SMs.

A block remains associated with one SM while it executes.

---

# 11. Warps

One of CUDA's most important low-level concepts is the **warp**.

A warp traditionally contains **32 threads**.

Conceptually:

```text
Block
 │
 ├── Warp 0 → 32 threads
 ├── Warp 1 → 32 threads
 ├── Warp 2 → 32 threads
 └── ...
```

The GPU executes threads in a warp using a SIMT model:

> **Single Instruction, Multiple Threads**

If the 32 threads execute the same instruction over different pieces of data, GPUs can be extremely efficient.

---

# 12. SIMT

SIMT is closely related to SIMD, but CUDA's programming model presents the programmer with individual threads.

Conceptually:

```text
Same instruction
       │
 ┌─────┼─────┬─────┬─────┐
 ▼     ▼     ▼     ▼     ▼
T0    T1    T2    T3    ...
 │     │     │     │
data0 data1 data2 data3
```

For example:

```cpp
c[i] = a[i] + b[i];
```

Each thread executes the same kernel but has a different `i`.

---

# 13. Why CUDA is important for AI

This is where CUDA becomes extremely important in modern computing.

Deep learning involves enormous numbers of operations such as:

```text
matrix multiplication
        +
vector operations
        +
tensor operations
```

For example:

```text
        Matrix A       Matrix B
           │              │
           └──────┬───────┘
                  ▼
             Matrix Multiply
                  │
                  ▼
              Matrix C
```

These operations contain enormous amounts of parallelism.

GPUs are therefore extremely effective for them.

CUDA provides the infrastructure that lets AI frameworks use NVIDIA GPUs.

---

# 14. CUDA and PyTorch

This is where CUDA connects directly to Python.

A modern AI stack often looks like:

```text
Python
   │
   ▼
PyTorch
   │
   ▼
CUDA
   │
   ▼
NVIDIA GPU
```

For example, in PyTorch:

```python
import torch

x = torch.tensor([1, 2, 3], device="cuda")
y = torch.tensor([4, 5, 6], device="cuda")

z = x + y
```

The Python code is very simple.

Underneath:

```text
Python
  ↓
PyTorch
  ↓
CUDA libraries / kernels
  ↓
NVIDIA GPU
  ↓
GPU computation
```

This is one of the most important reasons CUDA became central to AI development.

---

# 15. CUDA libraries

You normally don't write every GPU operation yourself.

NVIDIA provides highly optimized libraries.

Important examples include:

```text
CUDA
 │
 ├── cuBLAS
 │      → linear algebra
 │
 ├── cuDNN
 │      → deep learning primitives
 │
 ├── cuFFT
 │      → Fourier transforms
 │
 ├── cuSPARSE
 │      → sparse linear algebra
 │
 ├── NCCL
 │      → multi-GPU communication
 │
 └── TensorRT
        → inference optimization
```

So the CUDA ecosystem is much larger than CUDA C++ kernels.

---

# 16. CUDA and machine learning frameworks

The relationship can be visualized as:

```text
AI application
      │
      ▼
Python
      │
 ┌────┴─────┐
 ▼          ▼
PyTorch   TensorFlow
 │          │
 └────┬─────┘
      ▼
CUDA ecosystem
      │
 ┌────┼──────────┐
 ▼    ▼          ▼
cuBLAS cuDNN    NCCL
      │
      ▼
NVIDIA GPU
```

Therefore:

> You can use CUDA without being an AI researcher, and you can use NVIDIA GPUs for AI without personally writing CUDA kernels.

Most Python AI developers interact with CUDA indirectly.

---

# 17. CUDA vs OpenCL

CUDA is NVIDIA-specific.

Another important GPU computing standard is **OpenCL**.

Conceptually:

```text
CUDA
  ↓
NVIDIA GPUs


OpenCL
  ↓
multiple hardware vendors
```

CUDA generally provides a very deep NVIDIA-specific ecosystem.

OpenCL was designed as a more vendor-neutral framework.

There are also modern alternatives such as:

* Vulkan compute
* SYCL
* HIP
* ROCm

For example:

```text
GPU computing
      │
 ┌────┼─────────────┐
 │    │             │
CUDA OpenCL        SYCL
 │
NVIDIA
```

---

# 18. CUDA vs C++

CUDA and C++ are not competitors.

A better picture is:

```text
C++
 │
 └── CUDA extensions
        │
        ├── GPU kernels
        ├── thread model
        ├── memory model
        └── GPU runtime APIs
```

You can therefore think of CUDA programming as:

> **C/C++ programming + GPU programming model**

For example:

```cpp
__global__ void kernel()
{
    int i = threadIdx.x;
}
```

The C++ language provides the general syntax, while CUDA adds GPU-specific features.

---

# 19. CUDA vs Python

Likewise, CUDA and Python occupy different layers.

```text
Python
   │
   │ high-level
   ▼
PyTorch
   │
   ▼
CUDA
   │
   ▼
GPU
```

Python provides:

```text
easy programming
high-level abstractions
AI/data ecosystem
```

CUDA provides:

```text
GPU execution
parallelism
GPU memory management
GPU kernels
optimized NVIDIA libraries
```

This is why you can write sophisticated AI programs in Python while the actual numerical work happens on the GPU.

---

# 20. CUDA's importance in the history of computing

CUDA represents an important transition:

```text
Traditional computing

CPU
 ↓
computation


GPU era

CPU
 ↓
coordinates
 ↓
GPU
 ↓
massively parallel computation


AI era

Python
 ↓
AI framework
 ↓
CUDA
 ↓
GPU
 ↓
massive tensor computation
```

So CUDA is one of the technologies connecting:

**GPU computing → parallel computing → modern deep learning → modern AI.**

---

# 21. A useful analogy

Think of a CPU as a small team of highly versatile workers:

```text
CPU

Worker 1
Worker 2
Worker 3
Worker 4
```

Each worker can perform complicated tasks.

A GPU is more like a huge factory:

```text
GPU

worker worker worker worker worker ...
worker worker worker worker worker ...
worker worker worker worker worker ...
```

If you need to perform the **same simple operation on millions of pieces of data**, the factory is extremely effective.

CUDA is the system that lets you tell that factory:

```text
What work?
Which data?
How many workers?
How should they cooperate?
Where should the data live?
```

---

# 22. Where CUDA fits into your programming-language map

Given the programming-language history you've been exploring, I would place CUDA slightly differently from Java, Python, C, etc.:

```text
                    Programming
                        │
       ┌────────────────┼────────────────┐
       │                │                │
     Systems        General-purpose    Domain
       │                │              languages
       │                │                │
       C              Java              R
       C++            Python
       Rust           JavaScript
       │
       └──────┐
              ▼
       GPU programming
              │
            CUDA
              │
              ▼
         NVIDIA GPU
```

But CUDA is **not simply another general-purpose language**.

It is better categorized as a **GPU computing platform/programming ecosystem** built around NVIDIA hardware.

---

## 23. The most important concepts to learn

If you eventually want to learn CUDA itself, I would use this progression:

```text
Phase 1 — GPU fundamentals
    │
    ├── CPU vs GPU
    ├── parallelism
    ├── SIMD / SIMT
    └── GPU architecture

Phase 2 — CUDA programming
    │
    ├── kernels
    ├── threads
    ├── blocks
    ├── grids
    └── thread indices

Phase 3 — Memory
    │
    ├── global memory
    ├── shared memory
    ├── registers
    ├── constant memory
    └── memory transfers

Phase 4 — Performance
    │
    ├── warps
    ├── occupancy
    ├── coalesced memory access
    ├── synchronization
    └── divergence

Phase 5 — Libraries
    │
    ├── cuBLAS
    ├── cuDNN
    ├── NCCL
    └── TensorRT

Phase 6 — AI
    │
    ├── PyTorch
    ├── CUDA tensors
    ├── custom CUDA kernels
    └── GPU optimization
```

### The key idea

If you remember only one thing:

> **CUDA is NVIDIA's platform for turning the massive parallelism of NVIDIA GPUs into a programmable computing resource.**

And its relationship with the technologies you've been studying is particularly important:

```text
Python
   ↓
PyTorch / TensorFlow
   ↓
CUDA
   ↓
NVIDIA GPU
   ↓
massively parallel computation
```

That stack is one of the central technological foundations of modern AI.
