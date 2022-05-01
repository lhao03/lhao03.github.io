+++
title = "Paper: CARAT CAKE: Replacing Paging via Compiler/Kernel Cooperation"
date = 2022-04-30
draft = true
[extra]
understanding = 0
interest = 0
+++

Brian Suchy, Souradip Ghosh, Drew Kersnar, Siyuan Chai, Zhen Huang, Aaron Nelson, Michael Cuevas, Alex Bernat, Gaurav Chaudhary, Nikos Hardavellas, Simone Campanoni, and Peter Dinda. 2022. CARAT CAKE: replacing paging via compiler/kernel cooperation. In Proceedings of the 27th ACM International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS 2022). Association for Computing Machinery, New York, NY, USA, 98–114. [https://doi.org/10.1145/3503222.3507771](https://doi.org/10.1145/3503222.3507771)

# 1 intro
- paging requires hardware/software codesign spanning the hardware to main memory to deepest levels of the kernel
- hardware structures supporting virtual memory address translation together require same area as L1 cache
- TLB consumes a lot of energy and is thermal hot spot (13% of core power, 20-38% L1 cache energy)
- coupling of L1 cache and TLB (cache can start lookup in parallel with TLB lookup) limits numbers of sets in L1 cache, guarding against synonyms since cache is indexed by LSBs common to physical and virtual address
- CARAT removes this limitation => L1 cache could provide higher performance without needing to increase associativity

- compiler technology has been advancing => more available through vehicles such as LLVM

- CARAT can operate without hardware support
  - using compiler transformations along with runtime system to maintain precise view of a running program's memory at granularity of program objects.
  - transformations operate at level of the compiler intermediate representation (LLVM IR), CARAT is applicable to many unmanaged languages
- previous work only demonstrated implementation/evaluation at the user level, basically on top of paging within Linux process
- now will address the challenges posed by kernal
- CARAT CAKE: kernal-based implementation of CARAT concept
  - extend existing single address space (Nautilus) 
  - compiler transformations applied to user programs and kernel
    - user programs linked and signed
    - Nautilus loads signed user programs directly into kernel, running alongside kernel in kernel mode
    - protection achieved by compiler toolchain introducing protection checks

# 2.1 software
- use LLVM framework, level of LLVM intermediate representation (LLVM-IR) within the middle end 
  - middle end provides API to develop custom program-wide code analyses and transformations
- Clang is frontend, but middle end allows CARAT CAKE to be used with numerous other language frontends to LLVM

- Whole-Program LLVM (WLLVM/GLLVM): extends LLVM compilation to aggregate all LLVM bitcode in a project that uses separate compilation
  - CARATE CAKE must target entire applications and entire kernel: 
    - WLLVM allows CARAT CAKE transformations to run on entire kernel at once
    - whole-kernel bitcode source allows CARAT CAKE transformations to consider entire kernel as one module
