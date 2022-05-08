+++
title = "Paper: ProSE: The Architecture and Design of a Protein Discovery Engine"
date = 2022-04-30
draft = false
[extra]
understanding = 5
interest = 3
+++

Eyes Robson, Ceyu Xu, and Lisa Wu Wills. 2022. ProSE: The Architecture
and Design of a Protein Discovery Engine. In Proceedings of the 27th ACM
International Conference on Architectural Support for Programming Languages
and Operating Systems (ASPLOS ’22), February 28 – March 4, 2022, Lausanne,
Switzerland. ACM, New York, NY, USA, 14 pages. 
[https://doi.org/10.1145/3503222.3507722](https://doi.org/10.1145/3503222.3507722)

- marries SIMD-style computations with systolic array architectures

# 1 intro
- current GPU and TPU systems lack power and are optimized primarily for non-NLP models or NLP models that target human language with short input
- current architectures suited for patterns like convolutional filters, not present in Transformers
- amino acid is token, protein is input sentence of 300+ tokens
- Transformers usually require matrix multiplications with smaller matrice than TPU but larger than GPU
- few accelerators target BERT, and they only accelerate a portion of the model
- ProSE: multi-threaded [heterogeneous](https://en.wikipedia.org/wiki/Heterogeneous_System_Architecture) software-hardware co-designed system that contains collection of heterogeneous systolic arrays and special functions
  - streaming input data using output-stationary systolic array with no provision for specialized intermediate data storage such as local scratchpad
- use accumulator register within each multiply-accumulate unit as intermediate storage to reduce memory requirements

# 2.1 Human Language BERT Model vs. Protein BERT Model
- amino acids are 300-2000 tokens in length

# 2.2 Software Protein Binding Evaluation
- geometric binding affinity model OSPREY: high accuracy approach that simulates every atom in detail via costly protein structure information at cost of slow software inference
- BERT-style models able to mimic accuracy of OSPREY while excelling at hardware accelerations and also can perform arbitrary downstream tasks (unlike OSPREY)

# 2.3 Profiling of the Protein BERT Model
- percentage of matrix multiplications decreases, while element wise (Matrix Add/Div) and special functions increases
- matrix multiplications comprise of 32-52% of total runtime for all input lengths

observations
1) matrix multiplications of matrices smaller than TPU provisions, but larger than A100 tensor core
2) element-wise SMID operations/special functions that are usually dependent on result of MatMul or BMM

- use smaller and varying sized systolic arrays
- left-ration-capable systolic arrays => MatMuls 
- element-wise SMID operations or special functions in single data slow without need to store and refetch intermediate data

# 2.4 Impact of Input Sequence Lengths and Heterogeneity on BERT Performance
- homogeneous architecture has much steeper slope as input lengths increases to more than 128 tokens
  - from unnecessary overheads of executing small matrices as inputs on several larger homogeneous systolic arrays and lack of sufficient SIMD units 

# 3 Prose System
# 3.1 Software-Hardware Co-Design
- identify patterns in protein BERT model and each pattern is performed on the accelerator via pipelined dataflow-esque chaining 

**ProSE Systolic Arrays**
- systolic arrays operate in two modes: 
  - matmul: move data across PEs top-to-bottom, left-to-right and execute multiply-accumulate per PE  
  - smid: systolic arrays act as large left column rotates that perform element-wise SIMD-style ALU operations  using inputs from the left-most column of the systolic array and the vector register that stores streaming input
    - data moves right to left so SIMD ALUs can start executing as soon as left-most column of systolic array has completed its matrix multiplication w/o having to wait for rest of the columns to complete operations

**Systolic Array Types**
- divide up systolic arrays into three types, each executing one operation sequence to maximize system efficiency
  - M-Type: MatMuls, SIMD ALUs
  - G-Type: MatMuls, SIMG ALUs, GELU
  - E-Type: MatMuls, SIMD ALU, Exponential functions
- model is separable into Attention, Intermediate, Output sublayers
- for MatMul of varying sizes, smaller systolic arrays suffer less startup and draining costs but take much longer to complete MatMuls
- for SIMD ALU operations: the smaller systolic array, the larger the ratio of available SIMD ALU computation units to PEs

**Multithreaded Execution of Heterogeneous Systolic Arrays**
- more threads => less data-dependency bubbles => overheard of contention goes up

# 3.2 ProSE Architecture and Microarchitecture
**System Overview**
- heterogeneous collection of output-stationary, streaming systolic arrays packaged on one accelerator with host CPU via high-bandwidth external interface

**ProSE Operations**
- MatMul
- MulAdd
- MatDiv
- Exp
- GELU

**ProSE Processing Element**
- instead of having large local scratchpads or accelerator-attached memory
  - output-stationary systolic arrays that uses local multiply-accumulate accumulators as intermediate storage
  - streams input continuously from host

