---
title: "Blog Post: The Perils of JavaSchools"
date: 2022-04-28
tags: computer science education
---

[Original Blog Post](https://www.joelonsoftware.com/2005/12/29/the-perils-of-javaschools-2/)

- Java not hard enough programming language to discriminate between great programmers and mediocre programmers
- two things taught in university which many people never fully comprehend:
  - recursion and pointers

pointers
- universities used to start out with data structures course with heavy focus on pointers
  - weed out course

recursion
- [Structure and Interpretation of Programs](http://mitpress.mit.edu/sicp/full-text/book/book.html)
- Scheme course

now lot's of universities use Java: no pointers or recursion
- building big systems requires pointers and recursion

> You may be wondering if teaching object oriented programming (OOP) is a good weed-out substitute for pointers and recursion. The quick answer: no. Without debating OOP on the merits, it is just not hard enough to weed out mediocre programmers. OOP in school consists mostly of memorizing a bunch of vocabulary terms like “encapsulation” and “inheritance” and taking multiple-choice quizzicles on the difference between polymorphism and overloading. Not much harder than memorizing famous dates and names in a history class, OOP poses inadequate mental challenges to scare away first-year students. When you struggle with an OOP problem, your program still works, it’s just sort of hard to maintain. Allegedly. But when you struggle with pointers, your program produces the line Segmentation Fault and you have no idea what’s going on, until you stop and take a deep breath and really try to force your mind to work at two different levels of abstraction simultaneously.

> I can’t understand why the professors on the curriculum committees at CS schools have allowed their programs to be dumbed down to the point where not only can’t they produce working programmers, they can’t even produce CS grad students who might get PhDs and compete for their jobs.
