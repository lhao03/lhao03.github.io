+++
title = "Notes for: Critically Conscious Computing: Methods for Secondary Education"
date = 2022-04-23
updated = 2022-04-25
draft = false
[extra]
understanding = 9
interest = 8
+++

Amy J. Ko, Anne Beitlers, Brett Wortzman, Matt Davidson, Alannah Oleson, Mara Kirdani-Ryan, Stefania Druga (2022). Critically Conscious Computing: Methods for Secondary Education. [https://criticallyconsciouscomputing.org/](https://criticallyconsciouscomputing.org/), retrieved 4/23/2022.

I didn't take notes for the prior chapters because I just read them on my iPad and just highlighted.

Blog posts that were inspired by [Critically Conscious Computing](https://criticallyconsciouscomputing.org/)
- [Comparisons of how CS Courses are taught at UBC](@/blog/compsci/how-to-teach-cs-courses.md)
- [Computers are cool!](@/blog/compsci/computers.md)

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

{{ quote(text="However, because algorithm design often occurs in the context of for-profit businesses driven by sales and marketing, not by design, companies usually advance products independent of their social impacts.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/algorithms",
link="Critically Conscious Computing"
)}}

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

{{ quote(text="Over and over, algorithm designers make the same mistake of meticulously analyzing algorithms for their overall correctness, efficiency, and accuracy, but overlooking the impact on the margins of diversity. And the public, still enamored with the power of algorithms to automate human tasks, freely delegate vital human activities to algorithms, in the hopes of saving some time, but often at the expense of justice.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/algorithms",
link="Critically Conscious Computing"
)}}

## Teaching Algorithms
**teaching algorithms as canon**
- learn about efficiency of algorithms, differences between algorithms and practice implementing algorithms
- "creates a sense of membership in the CS community, where most members had to learn the same ideas"
- but it's hard to learn algorithms as canon:
{{ quote(text="Students demonstrate an abundance of misconceptions about how canonical algorithms behave, including difficulties with data structures and how canonical algorithms manipulate them. Teaching algorithms in the abstract (or with lightweight problem contexts, such as situating search algorithms in a specific problem domain), can make algorithms feel separate from the world. The result is that students often struggle to develop self-efficacy with algorithms, especially with algorithm design and analysis.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/algorithms",
link="Critically Conscious Computing"
)}}

- there are methods to engage students themselves as data for the algorithm: sorting themselves in a list, but may not be an effective way to teach algorithms:

{{ quote(text="These methods can be engaging ways of visualizing algorithm behavior, but some evidence suggests that the older students are, the more awkward they might find the physical interaction with their peers, and the less likely they are to view these visualization activities as authentic practice. Other results with middle school students suggest that the physical embodiment involved is hard for students to link to the substantially different representations of algorithms they find in code, and that they actually decreased students’ desire to further study CS.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/algorithms",
link="Critically Conscious Computing"
)}}

**teaching algorithms as infrastructure**
- canon is already taught in post secondary CS education, so might now be worth the time to teach in secondary education.
- most students will never implement a canonical algorithm themselves, and will use an already implemented version of it.

{{ quote(text="spending significant time teaching students to understand algorithms that have already been invented takes time away from the very different challenges of designing algorithms to solve problems in the world, and evaluating how well algorithms might solve problems. These are just as, if not more important to students who eventually pursue CS careers, but also important to those who won’t, as critically evaluating the quality of algorithms is something everyone that interacts with computers must do.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/algorithms",
link="Critically Conscious Computing"
)}}
- teaching algorithms related to society poses different challenges

{{ quote(text="The critical question about algorithms, then, is not how to automate something with an algorithm, but whether to and why.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/algorithms",
link="Critically Conscious Computing"
)}}

# [Abstractions](https://criticallyconsciouscomputing.org/abstractions)
Using APIs requires different knowledge:
- Domain Knowledge: knowledge about the domain in the world that the API is modeling and how it is modeling it
- Execution Semantics: how a function in an API behaves (types of input, how input maps to output, errors that could be produced, how long the function takes, how accurate the results are)
- Usage patterns: functions may have to be used in a particular way (input may have to be preprocessed).

{{ quote(text="This means that anyone that creates software — professional software developers, hobbyists, students learning CS in classes — will necessarily be engaging in informal learning about API abstractions, usually without well-designed instructional materials to support them. Thus, while removing details through abstraction can make complex things easier to use, it does not make them easy to use.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

## social tradeoffs of abstraction
- algorithms centralize decision making
- functions, classes, APIs -> centralizing decisions
- and privatize decision making

{{ quote(text="Therefore, encapsulation by private companies is a transfer of power from the transparent, public, human processes, to opaque, private, algorithmic processes. ",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

- also abstraction is a form of automation
  - automation is a vessel for hiding social consequences of automation 

## teaching abstraction use
teaching abstraction use: 
- teach the use of functions through practicing conforming to the syntax of function calls, trying different inputs, using functions in combination
- but also requires coverage of domain concepts, execution semantics and design patterns
  - best way to learn these things is through documentation, but documentation is hard to read
    - this results in students being confused, copying code they don't understand

{{ quote(text="Another challenge with teaching APIs, especially in project-based learning, is that no API can support every imaginable thing a student might want to make.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

{{ quote(text="The expressive power of an API to make many things possible is also a great risk to teaching, as students may find themselves needing to learn ideas that no one in the class, including the teacher, knows anything about.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

## teaching abstraction design
- HtDP: design recipes (CPSC 110!)

{{ quote(text="Students often struggle to self-regulate during such structured problem solving, often deviating from the sequence, or struggling to independently perform a particular aspect of the process.", 
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

- but not everyone may want to program, but they should still understand the role abstraction plays in society.
- code written years ago are in effect today and are making decisions today
{{ quote(text="Moreover, teaching abstractions as apolitical has consequences: rather than connecting students with the rich history of code that others have written over the past decades, abstractions and their goal of encapsulate and hide details, can create a kind of “wall” between students the ideas contained in them. This tradeoff, especially in the context of integrating CS into other disciplines, may actually harm literacy, as it eliminates opportunities to critically examine the assumptions and models embedded in abstractions.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}
{{ quote(text="
This is a tradeoff in learning objectives: students who focus on designing functions will be more capable of writing programs to solve particular computational problems, but may not see the social problems they might create with their designs, whereas students who focus on critically examining the implications of functions might see their consequences more clearly, but be less well positioned to design them.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}
  - learn designing and use in university, critically examine in secondary school

# [Artificial Intelligence](https://criticallyconsciouscomputing.org/ai)
- symbolic AI (using logic) vs statistical (using patterns in probabilities)
- strong AI is out of reach
{{ quote(text="In contrast, other applications of AI often enrich and liberate groups that already have power and wealth.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

{{ quote(text="AI, then, just like any other code, is often deployed as a tool of wealthy, dominant groups to accrue power, increase wealth, and maintain the matrix of oppression that erases diversity, denies equity, and shuns equality.", 
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

## Teaching AI
- Teaching AI Theory
- Teaching AI application

- Data is a record of the past; past injustices perpetuated into the future
- Data encodes values, assumptions, goals of people who create it

# [Programming](https://criticallyconsciouscomputing.org/programming)
- requirement of self-regulated skills
- process monitoring: reflecting on the process, like checking if you are following your plan
- comprehension monitoring: asking if you understand what happens if you change something in your code/do you know enough to change your code
- self explanation

{{ quote(text="Society has not yet broadly decided to make programmers responsible for their code and its impact, and until it does, making room for algorithmic justice will require personal and organizational will.", 
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/",
link="Critically Conscious Computing"
)}}

## Teaching programming 
- modern cs education conflates coding with cs
- programming is a skill not really taught  in post-secondary *(well CPSC 110 teaches programming systematically pretty well, but most universities don't really teach it well, they just hope students can "absorb" good programming practices)*
- programming skills viewed as something students will learn on their own
- secondary: does programming need to be taught?
  - argument: learning to code will transfer problem solving skills in other settings => mixed evidence on this
    - modest transfer for tasks requiring meta-cognition and creative thinking, but no evidence on effects on school achievement, literacy or other outcomes
- **no evidence that learning to code has impact on critical conciousness of computing in society**
  - help see how software is constructed but not how software impacts people's lives

## developing skills
- careful choice of PL, editor, tools and problems. 
- how do students receive feedback?
  - autograder: automatic checking, immediate feedback that is shallow and leads to gaming behaviour
  - teacher: deep diagnostic feedback but is time consuming and requires substantial pedagogical content knowledge
- methods to explicitly scaffold self-regulation skills => HtDP

- [Notes on Developing Developers](http://127.0.0.1:1111/blog/papers/compsci/developing-developers/)
- programming is a moral activity, which should be taken seriously with responsibility and care

# [Verification and Debugging](https://criticallyconsciouscomputing.org/verification)
- vagueness in requirements => failures
- contracting of government services to tech companies => tech companies become the ones in charge of making sure the service was being provided to citizens, rather than the government

{{ quote(text="In fact, because of the way the contract was structured, Deloitte received maintenance payments every month because there were failures to debug and fix, essentially rewarding Deloitte for making mistakes.",
author="Amy J. Ko",
source="https://criticallyconsciouscomputing.org/verification",
link="Critically Conscious Computing"
)}}

## teaching verification and debugging
- requirements are vague
  - if students are in charge of defining requirements, they may change them if they have trouble verifying and debugging, to avoid finding defects
- no simple separation between skill of writing programs and skill of verifying and debugging them.
- students will be doing both, and need support for both
- most students do not verify their programs in any systematic way
- fragile knowledge when debugging -> unproductive strategies from underdeveloped self-regulation and impulse control skills
  - even when taught effective debugging strategies, and even when they know them, they resist following them and use trial and error

### scaffolding verification and debugging
- block based editors: can only allow edits in syntactically valid ways
  - perceived as inauthentic because professionals don't use them
  - but don't prevent logic errors
- separate learning of program writing, verification and debugging => practice one at a time without added cognitive load of the other
- also can have students engage in code reviews or walk-throughs
- separate writing periods from verification periods

# [Tools](https://criticallyconsciouscomputing.org/tools)
- overwhelmed by number of new tools and rely on social communities to learn new tools.
- large investments in tools, small investments in materials and opportunities to learn them
- professional tools or educational tools designed for learning => CPSC 210

