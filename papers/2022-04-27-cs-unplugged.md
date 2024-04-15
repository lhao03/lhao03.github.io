---
title: "Paper: Teaching CS Unplugged in the High School (with Limited Success)"
date: 2022-04-27
tags: computer science education, paper
---

Yvon Feaster, Luke Segars, Sally K. Wahba, and Jason O. Hallstrom. 2011. Teaching CS unplugged in the high school (with limited success). In Proceedings of the 16th annual joint conference on Innovation and technology in computer science education (ITiCSE '11). Association for Computing Machinery, New York, NY, USA, 248–252. [https://doi.org/10.1145/1999747.1999817](https://doi.org/10.1145/1999747.1999817)

- CS Unplugged: introduce functional cs principles in active learning activates without use of computers
- results were at odds with the enthusiasm

# introduction
- outreach program, CS Unplugged, consists of set of modules that introduce fundamental cs principles through hands-on activities.
- program distinguished by two characteristics:
  - activities are designed to be completed without computers
    - instead complete kinesthetic tasks
  - activities are designed to support adaptation to suit a range of learning levels; instructors can reveal more detail as appropriate
- program at high school consisted of ten 40-minute sessions repeated for two semesters in an introductory programming course
- evaluation objectives:
  - evaluate impact of program on student attitudes towards computer science
  - impact of program on students' perceived content understanding

- however, program had no statistically impact in either evaluation objectives (with one exception)
  - some students attitudes moved in undesirable direction
- there are CS Unplugged activities in ACM K-12 Model Curriculums, so it's important to understand how CS Unplugged succeeds and fails
  
# related work
- Heersink and Moskal surveyed high school students on attitudes towards "computer science" and "information technology"
  - students could not distinguish between the two
  - attitude this confusion to broad use of educators who are both computer science and information technology teachers
- CS Unplugged was also introduced to younger children, middle school and grade 4, with positive impact on student interest in cs in middle school children. 
  - grade 4 children didn't like the binary activity
- CS4HS: emphasize how cs and cs careers are more than just programming

# program design
- lesson 1: binary numbers
  - convert between number systems
  - learn why binary is necessary
- lesson 2: anatomy of a computer
  - disassembly and reassemble computers
- lesson 3: information theory
- lesson 4: algorithms and sorting
  - discuss two sorting algorithms
  - ask students to sort themselves
- lesson 5: sorting networks and parallel computing
- lesson 6: graphs and mst
  - model airport routes and interstate maps as graphs
  - prim's algorithm in game
- lesson 7: routing and deadlock
- lesson 8: error detection and cryptography
- lesson 9: public key encryption 
- lesson 10: programming languages
  - blindfolded robot sent through maze based on tasks

# pilot program
semester 1
- gains in interest and content understanding were insignificant
- added accountability to program to ensure students were accountable for the lesson content

semester 2
- control group of semester 1 became experimental group of semester 2
- had to do worksheet after each lesson

# evaluation
- survey results indicated little to no change in interest/content confidence
- only question with significant change: I think I could explain what an “algorithm” is.
  - thought because algorithm was introduced early on and talked about in later modules
- more significant increase in interest from groups that didn't have much interest in the first place
- for students who were interested in cs before doing CS Unplugged, they gave lower ratings in post survey compared to their pre servery 
  - their interest still remained high though
- compared to control, there was no significant interest/confidence gain or gap closure among two experimental groups, and in many cases, the results were negative, especially among mid and high groups
- students seemed to learn cs and computer engineering were two different disciplines

**free response question 1: what topics/courses do you expect to study in university if you pursued a CS degree?**
experimental groups
- robotics, computer science, binary numbers, networking were four new topics in post survey => these topics were covered in the modules
- from both groups, students seemed to believe that computer programming was important to study in computer science
  - surprising because they weren't using computers and computer programming was never mentioned

control group
- thought that taking computer programming classes is not as important as they stated in their pre survey

**free response question 2: which high school classes would be important to prepare you for a CS degree in university**
experimental groups
- post survey, both groups thought the webpage design course was not as important as previously thought
- drew stronger connection between CS and math
  - differs from control group

both groups
- **control group drew stronger connection with cs and programming, experimental group drew stronger connection cs and math**

# discussion
reasons for, on average, no impact on student attitudes to cs or their perceived content understanding:
- high school students don't find kinesthetic activities as exciting as younger children
  - students were less motivated to participate than the researchers hoped 
- students who were already in a cs programming class were thought to be students who would be interested in CS Unplugged 
  - however, after reviewing data, these students seemed to perceive themselves as "experienced programmers", and so have less interest in learning these concepts
- other interactions of CS Unplugged were deployed at summer programs or after school programs, in which participants were self selected with strong pre-existing interest 
  - kinda contradicts the students with high interest who had interest go down based on this experiment


# my thoughts
- students in a cs programming course may already know a bit about the lessons presented, so it makes sense their interest doesn't change
- we shouldn't focus on increasing interest of students already interested, I word like to see this experiment conducted again on students **not** in a cs programming course. 
  - but doing so would be hard, because would these modules take time from another class? be after school? 
  - maybe as part of the "Science 10" unit, which comprises of a bit from biology, physics and chemistry at the moment
- the association of cs with math from the experimental groups is interesting, and I think a positive outcome, because students complain that CS degrees are too math and theory heavy because of incorrect assumptions that cs is only programming.
