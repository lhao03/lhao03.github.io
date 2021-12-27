+++
title = "λ Racket Shenanigans"
date = 2021-12-24
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

```python
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

### applying a grammer

