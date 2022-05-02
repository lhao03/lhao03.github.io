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

- NOELLE: provides high level abstractions on top of LLVM that allow for aggressive analyses and transformations
  - CARAT CAKE utilizes data flow engine, invariants and induction variables and dependence analysis to generate Program Dependence Graph (PDG) of program being compiled
  - overheard of CARAT CAKE is inversely related to accuracy of PDG

- Nautilus Kernel Framework: open source kernel codebase
  - contains minimal set of features needed to support a tailored parallel run-time environment, avoiding general purpose features that inhibit scalability
  - designed with goal of hybrid run-times
  - HRT: mashup of extremely lightweight OS kernel framework and parallel run-time system
  - all addresses mapped at boot, no swapping or page movement => TLB misses are rare and if TLB entries can cover physical address space of machine, there are no page faults
  - memory management (including for NUMA) is explicit and allocations are done with buddy system allocators
  - core set of I/O drivers have interrupt handler logic with deterministic path lengths
- address space (ASpace) was added 
  - memory map of regions, similar to `mm_struct` but designed without assumption of paging

# 3 
- escape: any reference to an Allocation stored outside of the initial Allocation pointer
- contained escape: an escape that is stored within an Allocation. This represents a subset of the Escapes within a program
- guard: protection check before memory access that ensures proper access permissions

- naive approach to software-based memory management and protection is horrifically slow

**goal**: provide the same capabilities as the traditional paging model
**trusted computing base**: CARAT approach is based on trust relationship between kernel and compiler toolchain
  - expansion of software TCB is in the analysis and transformations added to compiler toolchain to suppoer CARAT and is offset by decrease is size and complexity of hardware TCB

- compiler transforms the intermediate representation of all code, injecting runtime calls that match memory management features provided by paging
- Allocations and Escapes are tracked; all allocations produced from unmanaged language and visible at IR level are tracked
- compiler injects code that works at granularity of Allocations, instead of page granularity
- software checks, Guards, replace hardware-level checks
  - each memory access at IR level has Guard introduced before it
  - protection of stack achieved by introducing Guards before calls
  - Guard calls out to runtime to check
  - with good CARAT-specific compiler optimizations, it is possible to avoid most direct protection checks => central to good performance
- CARAT uses tracking information maintained by runtime to patch all relevant Escapes (when needing to move Allocations)

# 3.2 User-Level Prototype
- compiler toolchain has specially-developed custom data flow analysis, loop invariant analysis and induction variable analysis to omit redundant guard checks
- reduce dynamically-encountered guards

# 3.3 benefits of CARAT-Based System
**no more address translation hardware**
- no TLB misses because no more TLB 
- save memory the size of L1 cache
- removal of synonyms/homonyms from cache design => larger L1 caches

**software benefits**
- memory can be managed at an arbitrary granularity
- improvement of CARAT software would increase performance of existing programs on existing hardware
- no longer need to test and verify hardware of address translation
- bugs in protection/management fixed by software updates rather than microcode patching or major abstraction changes


# 4 design and implementation: baking a CARAT CAKE

# 4.1 system and design choices
- centered around mapping and protection
- compiler:
  - performs analysis and transformation to propel Allocation/Escape Tracking within kernel/user programs => memory mapping/movement
  - guard injections
- kernel: manage single physical address space in which all code and data coexist
  - allocates Memory Regions and groups them into ASpaces, which then kernel can delegate, expand, assign to entities needing memory
  - entities include kernel itself and processes
- compiler's instrumentation of kernel/user programs + runtime => memory tracking and protections per ASpace
- memory and protections are managed at level of Memory Regions
  - can be of arbitrary size => external fragmentation is concern
- compiler performs protections/tracking via statis analysis/transformations of application code => user-level developres don't need to know about CARAT-based system below.
- kernel builds stacks, heaps, for process by chucking physical memory directly without address translation

# 4.2 compiler
- CARAT CAKE compiler instruments both user and kernel code to track Allocations and Escapes and guide memory references in user code
  - now responsible for enforcing protections 
- intertwines tracking and protections with kernel-level permissions
- apply Address Checking for Data Custody data-flow analysis from previous work, loop invariant analysis, scalar evaluation analysis
- generalize compiler so it knows how to manage/optimize programs memory management at IR level where underlying assumptions about semantics/safety of memory accesses can differ
- compiler can elide guards for the following types of references:
  - explicit stack locations on IR
    - references within bounds of stack that the kernel set up itself and hands to program
  - global variables
    - section of executable that kernel will load and verify for the program
  - memory received from library allocator (malloc)
    - from region that kernel allocates and controls who it gives access to
