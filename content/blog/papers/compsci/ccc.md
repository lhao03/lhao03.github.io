+++
title = "Notes for: Critically Conscious Computing: Methods for Secondary Education"
date = 2022-04-23
updated = 2022-04-23
draft = false
+++

Notes for [Critically Conscious Computing](https://criticallyconsciouscomputing.org/)

# [Data Structures](https://criticallyconsciouscomputing.org/data)
- data is information encoded
- many approaches to teaching data Structures involve visual descriptions; excludes students who are blind
- databases hold a lot of data that tries to represent us
- data structures impose conformity

# [Algorithms](https://criticallyconsciouscomputing.org/algorithms)
- model the world imperfectly => reinforce, perpetuate, amplify unjust phenomena
- algorithms have mostly been taught as "how to use" vs applications in the world
- algorithms aren't particular to CS, but CS adds two things:
  - precise ways of expressing and reasoning about algorithms
  - ways of expressing algorithms as code so computers can execute them for us
- if we use algorithms we have to prove they aren't faulty in some way
  - USA no fly list misidentified people because of their algorithm; there should be some way to formally verify this or at least test it out in the real world
- sorting names can give names at the front of the list an advantage; sorting algorithm isn't at fault but the question is why sort by name in the first place?
- lots of decisions are being made by software systems with algorithms that aren't open to the public (like the sorting of student's names in grading software)

> However, because algorithm design often occurs in the context of for-profit businesses driven by sales and marketing, not by design, companies usually advance products independent of their social impacts.
- algorithms are faster than humans, so we are more wiling to replace human labour with computers
- only efficiency is the most focused on factor of an algorithm

algorithms can make assumptions about the world:
- sorting: does something need to be sorted and how?
- searching: information isn't always organized in ways to make it discoverable (SEO)
- pathfinding: google sometimes returns the shortest path but it's through an ally way so it's not always the safest. Sometimes I just use the map and find my own way, but in a place I'm unfamiliar with I put a lot of faith in the path that google maps finds.
- parsing: computers imply there is structure in text

should canonical algorithms be taught?
- yes: because they are ubiquitous
- no: since most canonical algorithms are already implemented, students don't need to know how they work
- yes: everyone should know how they work __"because they are the basis for the many ways that algorithms and data oppress: one cannot critique and resist algorithms that one does not understand."__
> Over and over, algorithm designers make the same mistake of meticulously analyzing algorithms for their overall correctness, efficiency, and accuracy, but overlooking the impact on the margins of diversity. And the public, still enamored with the power of algorithms to automate human tasks, freely delegate vital human activities to algorithms, in the hopes of saving some time, but often at the expense of justice.

## Teaching Algorithms
**teaching algorithms as canon**
- learn about efficiency of algorithms, differences between algorithms and practice implementing algorithms
- "creates a sense of membership in the CS community, where most members had to learn the same ideas"
- but it's hard to learn algorithms as canon:
> Students demonstrate an abundance of misconceptions about how canonical algorithms behave, including difficulties with data structures and how canonical algorithms manipulate them. Teaching algorithms in the abstract (or with lightweight problem contexts, such as situating search algorithms in a specific problem domain), can make algorithms feel separate from the world. The result is that students often struggle to develop self-efficacy with algorithms, especially with algorithm design and analysis.
- there are methods to engage students themselves as data for the algorithm: sorting themselves in a list, but may not be an effective way to teach algorithms:
> These methods can be engaging ways of visualizing algorithm behavior, but some evidence suggests that the older students are, the more awkward they might find the physical interaction with their peers, and the less likely they are to view these visualization activities as authentic practice. Other results with middle school students suggest that the physical embodiment involved is hard for students to link to the substantially different representations of algorithms they find in code, and that they actually decreased students’ desire to further study CS.

**teaching algorithms as infrastructure**
- canon is already taught in post secondary CS education, so might now be worth the time to teach in secondary education.
- most students will never implement a canonical algorithm themselves, and will use an already implemented version of it.
> spending significant time teaching students to understand algorithms that have already been invented takes time away from the very different challenges of designing algorithms to solve problems in the world, and evaluating how well algorithms might solve problems. These are just as, if not more important to students who eventually pursue CS careers, but also important to those who won’t, as critically evaluating the quality of algorithms is something everyone that interacts with computers must do.
- teaching algorithms related to society poses different challenges

> **The critical question about algorithms, then, is not how to automate something with an algorithm, but whether to and why.**

# [Abstractions](https://criticallyconsciouscomputing.org/abstractions)
