+++
title = "λ Racket Shenanigans"
date = 2021-12-24
draft = false
+++

[awesome book on creating languages in racket](https://beautifulracket.com/stacker/recap.html)

These are my notes on creating programming languages with Racket. 

# making funstacker, a functional version of stacker
You can find the full tutorial [here](https://beautifulracket.com/funstacker/).

```
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
```
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
