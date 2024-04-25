
# Table of Contents

1.  [week 1: tapl 9 and 11](#orgc3def3f)
    1.  [review](#org305e16d)
    2.  [critique](#org80944db)



<a id="orgc3def3f"></a>

# week 1: tapl 9 and 11


<a id="org305e16d"></a>

## review

TAPL 9 introduced the simply typed lambda-calculus. This extends the type system to allow functions in booleans. The $T_1 \rightarrow T_2$ type represents functions with input of type $T_1$ and output of type $T_2$. Next, to understand what happens when an argument is applied to an abstraction, the typing rule for abstractions is introduced. Additionally, since we can have nested $\lambda-$abstractions, we must also now consider if there is a typing context, $\Gamma$ that can influence or determine the type of a term. To prove type safety, we can use the inversion lemma (inversion of typing relation), uniqueness of types theorem (states there is one derivation of typing built from inference rules) and canonical forms lemma (tells us the types of values). The uniqueness of types theorem holds for the simply typed lambda-calculus, but this isn&rsquo;t true for many other type systems. To prove that evaluation preserves types, there are some structural lemmas to consider. One is that permutations of a context are equivalent. Another is the weakening lemma, which states that all bound variables in a context must have distinct names and this is also true when we add a new binding. Finally, there is the preservation of types under substitution lemma. Using these lemmas, the type safety property can be proved.

Most programs are converted to an untyped form before evaluation. This can be formalized with an erasure function. The theorem associated with erasure is that if a term $t$ can be evaluated in the typed form to $t'$, then when applying the erasure function to $t$, the evaluation of $erase(t)$ results in $erase(t')$. The application of erasure is seen in type reconstruction in languages like Haskell. Finally, this allows us to think about Curry-Style vs. Church-Style. Curry-Style is usually associated with implicitly typed systems while Church-Style is associated with explicitly typed systems.

TAPL 11 introduces features that are commonly found in programming languages. Throughout the chapter, it is a common theme that many of these features are generalizations of each other. Additionally, most features are of a derived form, meaning no changes need to occur to the internal language, the simply typed lambda calculus. This is seen in programming languages as &ldquo;syntactic sugar&rdquo;. First, there are base types, which are similar to atomic types in Racket. These is no internal structure to base types and we theoretically think of them as a set of *uninterpreted* types. An interesting base type, the `Unit` type is interpreted in the most simple way; a single term `u` which is an element of `Unit`. In languages like C, `Unit` is actually the `void` type. A widely used derived form is sequencing (evaluate the first term, ignore its result and evaluate the second term). Sequencing is seen in Rust where you don&rsquo;t add a semicolon at the end of an expression, but you do at the end of a statement. Languages like Java just add semicolons to the end of all lines of code. Next there are ascriptions, which means to assign a type to a term. Next, another somewhat derived form is the let binding; we use abstraction and application to achieve `let`-binding. While let can be a somewhat derived, we may not want it to be because languages with Hindley-Milner polymorphism have type checkers which use the `let` construct to generalize polymorphic definitions which cannot be emulated using ordinary $\lambda-$abstraction and application. There are also pairs, tuples, and records and sums, variants and options. Special applications of variant types are enumerations and single-field variants. Finally, general recursion and lists are also defined.


<a id="org80944db"></a>

## critique

The pros of the simply typed lambda-calculus is that it&rsquo;s pretty intuitive and small. Adding new features usually relies on typing rules and evaluation rules previously defined, so the type system is also recursive. This results in many proofs on the type system to be proofs of induction. However, due to the small size of this type system, adding new features that are complex may produce a large derivation tree, which could be slow to type check or evaluate with an typechecker/evaluator. Additionally, the simply typed lambda-calculus is not polymorphic, so for instance, for each identity function, we have to define a new abstraction with a input term with a specific type and a resulting term with the same specific type, since terms can only depend on terms. There also is no method of formalizing subtypes like those in OOP. Most scheme-like languages like Racket seem to follow the simply typed lambda-calculus very closely, even in semantics.

Some things that I&rsquo;m still unclear about include the lemma on inversion of the typing relation. To me it seems like the typing rules are bidirectional. For instance, one typing rule is $\tfrac{x:R \in \Gamma}{\Gamma \vdash x : R}$, and the lemma is if $\Gamma \vdash x : R$ then $x:R \in \Gamma$. Another thing that was mentioned is the uniqueness of types and how that results in one derivation from the inference rules. After learning about CFG, which are sometimes ambiguous, I wonder if this &ldquo;one derivation&rdquo; of the simply typed lambda-calculus system will prevent some features that other type systems have. Another point about general recursion was that &ldquo;no expression that can lead to non-terminating computations can be typed using only simple types&rdquo;, I&rsquo;m not sure why this is the case. This resulted in adding `fix` as a primitive; I&rsquo;m a bit confused on the requirement of using `fix`.

In comparison to Turing machines, lambda-calculus does not involve keeping track of state and has notation which is more intuitive and mathematical in nature. However, Turing Machines allow us to define algorithmic complexity, which I don&rsquo;t clearly see from lambda-calculus.

