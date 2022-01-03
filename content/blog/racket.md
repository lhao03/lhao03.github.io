+++
title = "λ Racket Shenanigans"
date = 2022-01-01
draft = false
+++

[awesome book on creating languages in racket](https://beautifulracket.com/stacker/recap.html)

These are my notes on creating programming languages with Racket. 

# making funstacker, a functional version of stacker
You can find the full tutorial [here](https://beautifulracket.com/funstacker/).

```rkt
(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '~a src-lines))
  (define module-datum `(module funstacker-mod "funstacker.rkt"
                          (handle-args ,@src-datums)))
  (datum->syntax #f module-datum))
(provide read-syntax)
```

- `format-datums` takes the list of lines and changes it into data. 
- for funstacker, we just want to return the input as `1 2 + 3 *` and change it into `(handle 1 2 + 3 *)`.
- that is what `(handle-args ,@src-datums)` is doing.
- now we need to make the `handle-args` function.

## for/fold
```rkt
(for/fold ([sum 0])
          ([int (list 1 2 3 4 5 6 7 8 9 10)])
          (+ sum int))
```

`for/fold` iterates over a list of values and each pass of the loop also returns an accumulator. The value of the accumulator is replaced with a new value. The loop ends when the iterator runs out of values. The return value is the final value of the accumulator.

For the example above, the accumulator is `sum` and iterator is `int`. 

`for/fold` has two mandatory parts, and two optional parts.
1. at least one accumulator needs to be defined and every accumulator needs to have an inital value.
2. at least one iterator needs to be defined.
3. (optional) guard expression, which limits the iteration with a test condition.
4. (optional) sequence constructor `in-list`. any sequence can be used directly as source of iterator values, including any list. 

# making bf, the next step!
[tutorial here](https://beautifulracket.com/bf/)

## intro
The essential parts of a language are:
- reader
- expander

But now we want to add grammer, basically allow us to specify the structure of a language. We need two new pieces:
- parser
- tokenizer

To use bf in racket: `#lang bf-demo`

### how bf works
- when starting up: create array of bytes in memory (each byte initialized to 0) and pointer into that array (initialized to the 0 position). 
- the current byte is the byte in the array at the location indicated by the pointer. 
- there are 6 operations:
  - \> increase pointer position by one
  - < decrease pointer position by one
  - + increase the value of the current byte by one
  - - decrease the value of the current byte by one
  - . write current byte to stdout
  - , read a byte from stdin and store it in the current byte (overwriting the existing value)

There is also a looping construct `[...]` that will repeat code within the brackets until the current byte is zero.

Recall the two functions each language needs: 
- reader: converts source file from string of characters into parenthesized S-expressions. `read-syntax`
- expander: determines how the S-expressions correspond to Racket code. Starts with macro called #%module-begin

Clean, well-structured S-expressions makes writing an expander much easier.

The way we can convert any well-specified programming language into S-expressions is by using a grammar.

## grammars and parsers

### parsing and parse trees
parsing: converting source code from a format for humans into one optimized for a computer.
- the data structure that emerges from the parser is a parser tree.

In Racket, a parse tree can be notated as an S-expression. A parse tree describes structure of code, but doesn't tell us how the code will actually run.

```python3
if y > 0:
  x / y
else:
  print("nope")
```

```
'(if (> y 0)
     :
     (/ x y)
     else:
     (print "nope"))
```

```rkt
(if (> y 0)
  (/ x y)
  (print "nope"))
```

Racket looks similar to the parse tree!

### parsing power tool: a grammar
It makes more sense to use a parser generator to make a parser from a specification of the structure of the language (a grammar).
- a grammar: way of notating the structure of every possible program written in that language.
- grammar based parser is like regular expression, but it produces parse trees.

**why we should write a grammar vs. make a parser by hand.**
- we can use grammars that already exist, like Python's grammar, to make a Python-like language.
- a grammar is a reality check; if we can write a grammar, chances are good that the language will work out. If we can't, it's a warning our language will have wrinkles (Markdown)
- easier to amend a grammar then hand-crafted parser. 

**why we can't parse with regular expressions** 
- regular expressions treat strings as flat, sequential data

## grammar notation
- consists of production rules, written one per line. On the left of each rule is the name of the structural element. A colon goes in the middle of the rule. This notation style is known as EBNF. On the right of each rule, we have a pattern for that element.
- the right side can include: literal strings, classes of strings, names of other production rules. Multiple possibilities are separated by |

### applying a grammar
- parser takes string of source code
- starting with first production rule, parser tries to match source code to pattern on the right.
- if the pattern contains names of other rules of grammar, parser recursively tries to match those rules, again using patterns on the right.

This process continues until one of two things:
- the parser decomposes source code into something that can't be further decomposed -> terminals. A parse tree is returned (the leaves of a parse tree are always terminals)
- the parser can't find any way to decompose source code into terminals; parse fails.
 It's trial and error (parser could try lots of unsuccessful paths)

 ### ambiguous grammars
 - you could write a grammar that can produce more than one valid parse tree for the same string
 - but you should avoid this

### groups and multiples in patterns
a grammar for stacker
```
stacker-program : "\n"* instruction ("\n"+ instruction)*
instruction     : integer | func
integer         : ["-"] digit+
digit           : "0" | "1" | "2" | "3" | "4"
                | "5" | "6" | "7" | "8" | "9"
func            : "+" | "*"
```
- parenthesizes create subsequences. 
- \* means zero or more
- \+ means match one or more of the preceding item
- [] means zero or 1 of the enclosed item

```
4
8
+
3
*
```

```
'(stacker-program
  (instruction (integer (digit "4")))
  "\n"
  (instruction (integer (digit "8")))
  "\n"
  (instruction (func "+"))
  "\n"
  (instruction (integer (digit "3")))
  "\n"
  (instruction (func "*")))
```
notes about how the parse tree lines up with the grammar:
- each node in parse tree corresponds to production rule, starting with name of rule followed by elements that matched the pattern for that rule
- rules that rely on other rules leads to nesting.
- every character that appeared in original source string appears in parse tree.


## the parser
- bf is just a list of operations and loops
  - so the first line means: either `bf-op` or `bf-loop` and zero or more of
- now define bf-op and bf-loop
```
bf-program: (bf-op | bf-loop)* 
bf-op: ">" | "<" | "+" | "-" | "." | "," 
bf-loop: "[" (bf-op | bf-loop)* "]"
```
and that's the grammar for bf! There are other ways to define the grammar but this is the easiest because `bf-program` only appears ones and it is the least number of rules.
 
### converting a grammar to a parser
- we will use a parser-generating language called `brag` that takes a list of production rules and turns those into a working parser.

## the tokenizer
- source string is converted to tokens
- tokenizer sits between source string and parser
- a tokenizer is optional: if we don't use a tokenizer, then every character that appears in the source code counts as a token.

Some tasks that are easily handled by the tokenizer?
- meaningless strings in source code can be removed
- strings that represent a value can be labeled with a generic token type
- strings that should be handled literally can just pass through

Downside to a tokenizer
-  substrings removed (like comments) are invisible to the parser.
-  tokens are indivisible; once we fuse a substring into a token, it can't be decomposed further by the parser. big tokens can be convenient because they reduce complexity, but they also reduce flexibility.

### designing the bf tokenizer
The bf grammar omits one detail: that any characters besides the eight used should be ignored.
- the bf tokenizer is simple: pass through eight characters intact and toss out everything else

### writing a reader with a tokenizer
- instead of manually reading in strings of code from port, pass port to make tokenizer, which returns function that reads characters from port and generates tokens
  - make-tokenizer creates and returns a function next-token that parser calls repeatedly to retrieve new tokens
- use those tokens with parse, to make parse-tree
- create `module-datum` and put `parse-tree` inside
- finally use `datum->syntax` to package code as syntax object

tokenizing rules
- helper function: lexer
  - each branch of lexer represent a rule: right side of token-creating expression, left side is pattern
  - each time `next-token` is called, `bf-lexer` will read as many characters from port as possible while still matching a rule pattern (greedy matching).
  - right side of rule with convert matched characters into token, which is returned

```rkt
(require brag/support) ;; we need to so we can get lexer
(define (make-tokenizer port)
  (define (next-token)
    (define bf-lexer
      (lexer
       [(char-set "><-.,+[]") lexeme] ; matches to one of our eight characters; we pass to lexeme (that thing we just matched)
       [any-char (next-token)])) ; think of else as else branch; we call next-token, basically skipping to the next available token
    (bf-lexer port))  
  next-token)
```
- at the end, an `eof` is emitted, the lexer emits an `eof` 

## making the expander: an imperative expander
- grammar tells us how many macros or functions we need
- we need to handle three types of parse nodes: `bf-program`, `bf-op`, `bf-loop`

Why grammar is awesome
1. each production rule in the grammar will have a corresponding macro/function in the expander.
2. the name of the production rule is the name of the macro/function
3. the pattern of the production rule describes possible input to its corresponding macro or function.

Choosing function vs macro: use function where we can, a macro where we must
- simple (return its args in a list or print them) -> use function
- rearrange code in a way that a function can't -> macro

`+[>]` will be parsed into:
```
(bf-program (bf-op "+") (bf-loop "[" (bf-op ">") "]"))
```

our expander goes as follows:
- call `bf-program` macro with two input arguments:
  - `(bf-op "+")`
  - `(bf-loop "[" (bf-op ">") "]")`
- call `bf-op` macro with one input:
  - "+"
- call `bf-loop` macro with three input arguments:
  - "["
  - "]"
  - `(bf-op ">")`
- call the `bf-op` macro with one input argument:
  - ">"

### from grammar to syntax pattern
- syntax pattern is like a regular expression

`bf-program` macro:
`bf-program: (bf-op | bf-loop)*`
```rkt
(bf-program OP-OR-LOOP-ARG ...)
```
- `bf-program` denotes literal identifier in the code, and is name of macro. every element of a `define-macro` syntax pattern matches literally
- unless it's in all caps. 
  - pattern variable: can catch everything
- the ..., similar to * quantifier. used after a pattern variable, the ... gathers al arguments that follow. can also match 0 arguments.

Return value of a macro is a syntax template.
- we return a void, which discards the arguments.
- `define-macro-cases` it's like a cond

## a functional expander
We have two goals
- avoid keeping state
- avoid mutation

Tricky because bf by nature is imperative

- in funstacker we learned we can approximate behaviour of state variables by turning them into accumulators with `for/fold`
- with functional programming idiom: model `bf` operations that take a current array and pointer as input and return new array and pointer values as output.
- instead of storing state values outside the function, let the values travel through the functions

### restarting the expander
- model new `bf` operations as functions that take two input arguments, array and pointer, and return a new array and pointer.
- we want return value of a `bf-func` to become input arguments of the `next-bf-func`. 
  - but `bf-func` only returns one value and `next-bf-func` needs two values.
  - we cure this mismatch by using `apply`

`apply`
- takes a function and list of values as input, and calls the function while using those values as input arguments
- these two expressions are equivalent
- kind of like takes the list apart.
```rkt
(apply func (list arg1 arg2 arg3 arg4))
(func arg1 arg2 arg3 arg4)
```
- the above example stipulates `func` is a run time function, not a macro; macros cannot be passed as an argument to any higher order function.

```rkt
(define (fold-funcs apl bf-funcs)
  (for/fold ([current-apl apl])
            ([bf-func (in-list bf-funcs)])
    (apply bf-func current-apl)))
```
- `fold-funcs`: takes two input args, `apl` and a pointer; the return value of `bf-func` and list of `bf-funcs`
- when `for/fold` starts, it creates an accumulator called `current-apl` to hold current state of the `bf` program, and initializes it to the `apl` argument passed as input.
- then it iterates over the list of `bf-funcs`
- on each iteration it uses `apply` to pass `current-apl` as arguments to the next `bf-func`
- once we run out of `bf-funcs`, the last value of `current-apl` becomes the return value of the `for/fold` loop, and therefore the `fold-funcs` function.

now we can write the macro for `bf-program`
```rkt
(define-macro (bf-program OP-OR-LOOP-ARG ...)
  #'(begin
      (define first-apl (list (make-vector 30000 0) 0))
      (void (fold-funcs first-apl (list OP-OR-LOOP-ARG ...)))))
(provide bf-program)
```
- we want to return code for two expressions; syntax object can only represent one.
- any time we want to return multiple expressions: use `begin`
  - unlike `let`, `begin` does not create a new scope for variables, any variables inside a `begin` are visible outside as well
- macro should not return a value, so pass result to a void.

now we write the macro for `bf-loop`; there are two things to observe
- when `bf-loop` arrives at `fold-funcs`, it is expected to behave as `bf-func`. So the return value of `bf-loop` macro has to be a function that has two input args and 1 output arg.
- `bf-loop` is mini `bf` program that runs repeatedly until a certain condition is met.

```rkt
(define-macro (bf-loop "[" OP-OR-LOOP-ARG ... "]")
  #'(lambda (arr ptr)
      (for/fold ([current-apl (list arr ptr)])
                ([i (in-naturals)]
                 #:break (zero? (apply current-byte
                                       current-apl)))
        (fold-funcs current-apl (list OP-OR-LOOP-ARG ...)))))
(provide bf-loop)
```

the last macro is `bf-op`, but instead of returning a self-contained function, just return only the name of corresponding function -> so `fold-funcs` can `apply` a list of arguments to it.

### making it faster
- this functional version is much slower because of the `set-current-byte` func
  - we make a new array every time, which is 30k bytes, and the garbage collector has to run more often to free up memory.
  - to make it faster we can just use the input array

