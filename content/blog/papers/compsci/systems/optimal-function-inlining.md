+++
title = "Paper: Understanding and Exploiting Optimal Function Inlining"
date = 2022-05-04
draft = false 
[extra]
understanding = 6.5 
interest = 9
+++

Theodoros Theodoridis, Tobias Grosser, and Zhendong Su. 2022. Understanding and Exploiting Optimal Function Inlining. In Proceedings of the 27th ACM International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS ’22), February 28 - March 4, 2022, Lausanne, Switzerland. ACM, New York, NY, USA, 13 pages. [https://doi.org/10.1145/3503222.3507744](https://doi.org/10.1145/3503222.3507744)

- inlining functions enables other optimizations because you can now see the function body
- however choosing which functions to inline are nontrivial because inlining a function can affect the rest of the compiler pipeline
- outperforms state-of-the-art LLVM by 7% on average

# 1 introduction
- inlining can enable to dead code elimination or lead to code size bloat
- inlining is as hard as knapsack NP-complete problem; so there's many heuristics
  - heuristic: trial and error method 
- no systematic study to investigate optimal inlining
- focus on reducing binary size: deterministic and does not depend on workload selection, while performance does
- straightforward search space is 2^n, where *n* is the number of inlinable call sites
- local independence property => autotuning strategy

contributions made
- novel formulation of the search space
- first extensive systematic study of optimal inlining 
- simple, effective inlining autotuning strategy

# 2 background
- notation: {{ katex(body="\{(A \rarr B) : inline, (B \rarr C) : no-inline\}") }}
- inlining may introduce multiple copies of the same call

# 3 formulate the inlining search space
- given a call graph *G* with {{ katex(body="|E_G|") }} edges, {{ katex(body="2^{|E_G|}") }} configurations exist, and all of them must be evaluated to to find the optimal 
- independent components can be independently explored
  - considering the connected components of a graph, *cc*, the search space becomes {{ katex(body="\sum_{c \in cc} {2^{|E_G|}}") }}
- connected components: are independent w.r.t inlining
- not inlining a bridge is identical to deleting it w.r.t inlining: additional independent components are created
  - bridge: edge that when removed will increase the # of connected components
  - each inlined call can potentially extend the scope of compiler transformations
  - inlining callgraph *B* that connects two call graph components is the only way to combine their optimization scopes 
    - if *B* is not inlined the components can be independently searched
- partitioning the search space can potentially lead to a smaller search space
- new bridges are created as callgrpah is dynamically updated by removing non-inlined edges or merged nodes across inlined ones => used to reduce the search space
- can be visualized through an inlining tree (it's recursive!)
  - outgoing edges are labeled inline or no-inline
  - each path from root to leaf is inlining configuration
  - the search space is the number of `InliningTreeLeafs` plus the number of `InliningTreeComponentNodes` in the tree
    - each leaf corresponds to a partial inline configuration and each set of independent inlining components require an extra evaluation to combine the best child configurations
- partition edge selection: prioritize bridges so many independent components arise

# 5 local inlining autotuner for size
- a large percentage of edges is not inlined
- shorter inlined call chains are more prevalent
- all optimally inlined call chains contain only one edge, so they are either in different connected call graph components or no inlined edges connect them
