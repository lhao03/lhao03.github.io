+++
title = "💻 Intro to Technical Interviews"
date = 2021-11-08
draft = true
[extra]
category = ["random"]
+++

I put on a workshop for HackCamp 2021, and thought I'd write an article about the workshop! Here are the [slides](https://docs.google.com/presentation/d/13aEWjCiM94rCYtpk9mAyOdFH7Xti1CZMbzkTMQAAZCc/edit?usp=sharing).

Article to come!

```python
def longest_orf_improved(rna: str) -> str:
    start_codons = ["AUG"]
    stop_codons = ["UAG", "UAA", "UGA"]
    max_len = 0
    start_orf = None

    for i in range(0, len(rna) - 2):
        codon = rna[i:i+3]
        if start_orf:
            if codon in stop_codons:
                max_len = max(i - start_orf, max_len)
                start_orf = None
        else:
            if codon in start_codons:
                start_orf = i + 3
    
    return max_len
```

```rkt
(define (longest-rna rna0)
  (local [(define (fn-for-rna rna orf c m)
            (cond [(zero? (string-length rna)) m]
                  [else
                   (if (start? (substring rna 0 3))
                       (fn-for-rna (substring rna 3) true c m)
                       (if (stop? (substring rna 0 3))
                           (fn-for-rna (substring rna 3) false 0 (max c m))
                           (if orf
                               (fn-for-rna (substring rna 3) true (+ 3 c) m)
                               (fn-for-rna (substring rna 3) false c m))))]))

          (define (stop? codon)
            (or (string=? codon "UGA")
                (string=? codon "UAA")
                (string=? codon "UAG")))

          (define (start? codon)
            (string=? codon "ATG"))]
    (fn-for-rna rna0 false 0 0)))
```
