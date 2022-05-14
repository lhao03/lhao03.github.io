+++
title = "The Computer Science Degree: Theory vs. Application"
date = 2022-05-11
update = 2022-5-13
draft = true
+++

*I talk about research and ideas in this blog post from a scientific point of view*

The natural sciences, like physics, chemistry and biology, are based on experiments which require vocational skills. But data curation and collection is meaningless without the theory to understand the data. If you want to develop vaccines or drugs, you need to study chemistry and biology. If you want to find the next smallest particle (quark anyone?) or far away planet, you need to study physics

{{ blogImg(img="quark.jpg")}}
*Apparently this is evidence of a quark. You tell me if you can understand what this image is without a strong theoretical background in physics.*

But maybe some people don't care about being correct and novel, they might just care about being correct[^think]. I would being correct vs. *correct and novel* as the difference between a chemist and a chemical engineer: 
> The old joke is that with chemistry you learn how to make a new molecule, but with ChemE you learn how to make 800 tons of it as cheaply as possible.[^chem reddit]

Of course, I'm not saying engineers can't have novel and correct ideas, but you can be successful as an engineer just by being correct. If you're a sciencetist who can't think of novel ideas, it's harder to be successful. A scientist needs to think of ideas that don't even exist. I believe theory allows you to be correct and novel. You can't come up with correct and novel ideas with just vocational skills.

Obviously this means if you just want to be correct, then an engineering degree is probably for you. If you want to do research, think beyond the scope of what is known, and discover something novel, then you need the theory, which means pursuing a degree in the natural sciences. You probably already know this, but engineering can't exist without all the years of research done. However, during the short history that us humans have lived, maybe less than 1000 humans have discovered a novel idea that propelled science forward. There's not many people who *can* be novel and correct, but it's always worth trying.

Many people enjoy a certain field, but have no interest in advancing the field and that's totally okay. Research is has uncertain goals and uncertain rewards, which can scare people, including the people who decide to pursue research. Some people just take the elements for granted; they don't care about why electrons are in clouds. However, the quantum nature of electrons is something I want to learn more about. On the other hand, I think genetics is cool, but I have no interest in understanding why certain alleles are closer to each other on a gene.  

In the case that people just care about being correct, there are a lot of engineering disciplines to choose from, like chemical engineering, electrical engineering, computer engineering, environmental engineering, materials engineering, civil engineering, petroleum engineering, and many more. Compared to a degree in sciences like chemistry or biology, engineering degrees are more applied, and more focussed on correctness rather than preparing to discover new ideas. A chemist could probably work as a materials engineer, but someone with a degree in materials engineering would be more efficient and cheaper to employ. A materials engineer will study chemistry and physics, including topics like atomic bonding, elctrochemistry, free energy, etc[^ubc materials engineering].  But a chemistry major and materials engineering major will study atomic bonds differently. For instance, a materials engineer will learn that ceramics include metallic and van der waals bonds[^materials atomic bonding], and that would be the extent of a material engineer's course material on atomic bonding. A chemistry major would learn about *why* certain bonds exist between molecules and not others in a series of courses like "Electronic Structure of Atoms and Molecules"[^412] and "Introduction to Quantum Mechanics and Spectroscopy"[^312]. Engineers learn about processes to be a efficient, correct and useful to industry.

The natural science degrees (chemistry, physics, biology, math) have their place and the engineering degrees have their place. But what is the computer science degree? At some universities, the computer science major is part of the sciences, while at other universities computer science is part of engineering. Where should it go? More theory, or more applied? Should the computer science degree prepare students to conceive novel and correct ideas or prep them with the processes they need in a technology industry?

# The Computer Science Degree: An analysis 
If you look at different curriculums and course offerings, you can kind of differentiate between a university that treats computer science more as science or engineering:

## Analyzing the schools
UBC, USC, UofT and NU both offer the computer science major as a bachelor in science. However,

- at UBC, computer science is under the Faculty of Science
- at USC, computer science is under the Viterbi School of Engineering
- at UofT, computer science is under the Faculty of Arts and Science (for the St. George Campus at least)
- at NU, computer science is under the Khoury College of Computer Sciences

**Comparison of Core Computer Science Courses Required for the Degree**

|UBC|USC|UofT|NU|
|---|---|---|---|
|CPSC 110: Computation, Programs, and Programming|CSCI 102L: Fundamentals of Computation|CSC108H1: Introduction to Computer Programming|CS 2500: Fundamentals of Computer Science 1|
|CPSC 121: Models of Computation|CSCI 170: Discrete Methods in Computer Science|CSC165H1: Mathematical Expression and Reasoning for Computer Science|CS 1800: Discrete Structures|
|NA|CSCI 103L: Introduction to Programming|CSC148H1: Introduction to Computer Science|CS 2510: Fundamentals of Computer Science 2|
|CPSC 210: Software Construction|CSCI 201L: Principles of Software Development|CSC207H1: Software Design|CS 3500: Object-Oriented Design|
|CPSC 221: Basic Algorithms and Data Structures|CSCI 104L: Data Structures and Object Oriented Design|CSC236H1: Introduction to the Theory of Computation/CSC263H1: Data Structures and Analysis|NA|
|CPSC 320: Intermediate Algorithm Design and Analysis|CSCI 270: Introduction to Algorithms and Theory of Computing|CSC373H1: Algorithm Design, Analysis & Complexity|CS 3000: Algorithms and Data/CS 3800: Theory of Computation|
|CPSC 213: Introduction to Computer Systems|CSCI 356: Introduction to Computer Systems|CSC258H1: Computer Organization|NA|
|CPSC 310: Introduction to Software Engineering|CSCI 310: Software Engineering|Co-op or 1 out of the project/inquiry based courses|CS 4500: Software Development|
|CPSC 313: Computer Hardware and Operating Systems|CSCI 350: Introduction to Operating Systems|CSC209H1: Software Tools and Systems Programming/CSC369H1: Operating Systems|CS 3650: Computer Systems|
|NA|CSCI 360: Introduction to Artificial Intelligence|NA|CS 2810: Mathematics of Data Models|CS 2810: Mathematics of Data Models|
|NA|CSCI 353: Introduction to Internetworking|NA|CY 4740: Network Security|
|NA|NA|NA|CY 2550: Foundations of Cybersecurity|

## Overall Observations
After I compared computer science course offerings[^ubc courses],[^usc courses],[^uoft courses],[^nu cs] and computer science core curriculums, here are some things that jump out to me:

These thoughts are based on my experiences at UBC and any course information I could find online. I was able to easily find many course websites (which included detailed sylabus, assignments, slides and labs) from USC and NU. I couldn't find any course websites for UofT. So take these thoughts with a grain of salt.

### UBC[^ubc cs]:
- introductory computer science course is taught in functional paradigm
- there is a large focus on *functional programming* which is regarded as more "theoretical" due to its mathematical nature
  - the result of a larger focus on functional programming means students engage more with concepts like recursion
- *students are introduced to pointers and memory management in the second year, later than other universities*
- students must learn a lot more programming languages including BSL (dialect of Racket), Java, C, C++, etc.
- UBC has recently released a industry focussed course called "Applied Industry Practices", though it's only offered in the summer
  - thus UBC does not have as many industry/skills type of courses as other universities
- compilers course is based on functional paradigm (Racket)[^ubc compilers]

### UofT[^uoft cs]
- uses Python as first programming language
- no need for students to take explicit software engineering course if they have done co-op. They can also choose out of a list of courses (meaning they don't need to do a software engineering course)
- courses tend to use Python and C for systems courses, and Java for OOP course
- as a result of programming language choices, courses are *more OOP and imperative based*
- has more industry type of courses like "Programming on the Web", "Natural Language Computing", "High-Performance Scientific Computing"
- *students are introduced to OOP first and imperative programming first (no recursion, pointers or memory management like UBC and USC)*
- compilers course is based on imperative paradigm (Using Python???)[^uoft compilers]

### USC[^usc cs]:
- uses C++ as first programming language
- courses seem more continuous, with 103L following right off from the end of 102L. 
  - probably because C++ is used, and C++ fits nicely with the operating systems course, data structures, and algorithms course
  - only other language used is Java for OOP
- required to take ENGR 102, the engineering freshman academy
- required to take Introductions to AI and Internetworking
- choice of choosing a capstone course of either "Design and Construction of Large Software Systems" or "Creating Your High-Tech Startup"
- required to take an embedded systems course
- has many "skills" focussed courses like "Professional C++", "Native Console Multiplayer Game Development", "Programming Graphical User Interfaces"
- also has more industry type of courses like "Creating Your High-Tech Startup", 
- *students are introduced to pointers and memory management in their first year, while they are introduced to recursion/functional programming in their second/third year*

### Northeastern[^nu cs]
- first year computer science course is similar to UBC's 
- two fundamentals courses (2500 and 2510), whereas UBC only has one (CPSC 110), before the OOP course
- students are required to do a security course
- there are both theoretical and proof based courses like computer-aided reasoning, verification, synthesis. I haven't seen other universities have these type of courses at the undergrad level
- there are also very industry and skills focussed courses like mobile development and web development.
- there are several concentrations a student can choose to do, including concentrations that are more theoretical and concentrations that are very industry focussed. 
- only one low level course required
- a theory of computation course is required
- there is also a statistics/mathematics course that is tailored for the computer science major: "Studies the methods and ideas in linear algebra, multivariable calculus, and statistics that are most relevant for the practicing computer scientist doing machine learning, modeling, or hypothesis testing with data"
- students learn about Turing machines, Church-Turing thesis, automata as part of their version of CPSC 320. Students at UBC can also learn about the mentioned concepts but in another course (so it's optional)
- there is a strong theory base for computer science degrees, but after that your degree can be very theoretical or industry/skills focussed

In Canada, computer science seems to be treated closer to science, meaning students don't take many computer engineer like courses, while in the USA, computer science seems to be treated more as engineering, meaning students usually take a few low level hardware/systems courses that electrical and computer engineers take.

The core curriculums are pretty similar in regards to courses in operating systems, systems programming/computer systems/computer organization. I'm guessing this is because many universities will teach students about the Linux operating system. This is probably because Linux is open sourced so it's easier for professors and students to access (they can access Linux through university servers), and how there's basically only two operating systems Linux (Unix/MacOS) and Windows. Of course there are differences between Linux and MacOS, but those are the two general categories of operating systems. Additionally, since most systems programming has been done in C, 99% of the time C is the language of choice for these courses.

For data structure and algorithm courses: At UBC, C++ is used for CPSC 221. USC also uses C++ for CSCI 104L. At UofT, I can't seem to find what CSC263H1 is taught in, so I will assume no programming language is used, thought I may be completely wrong on this. NU also doesn't seem to use a programming language in their data structures and algorithms course. Other then that, the data structures and algorithms course is pretty similar in content between schools.

What differs the most are the introductory computer science courses, and they differ drastically. UBC's[^110] introductory computer science course teaches functional programming following the HtDP curriculum using teaching languages like BSL. USC[^102] uses C++ and teaches pointers. UofT[^108] follows the book "Practical Programming (3rd ed): An Introduction to Computer Science Using Python 3" uses Python to teach a bit of OOP but not really anything about pointers or functional programming (?).

Additionally, some schools like UofT and NU offer "pathways" which list suggested/required courses a student should take. For instance, there are specializations like "HCI", "Systems", "Foundations", etc. UBC doesn't have something like this, but students could form their own pathway (it's just not as explicit). These pathways allow students to choose if they want their degree to be more theory based or skills based.

# The Different Types of Schools
There's a school of thought that functions are either pointers or values. A C programmer would say "well functions are simply pointers you pass around". A Racket or ML programmer would say "well we treat functions just like data, so they are values". What about the Java or Python programmer? Well, I'm not sure. An introductory computer science course usually falls within one (or neither) of these schools.

Additionally, the higher year courses a university offers can also greatly influence a student's degree. Based on how a university conducts their introductory computer science course and the upper year offerings, I've come up with three types of schools.

## The Engineering (Pointer) School
Schools in the USA that classify computer science under engineering such as USC fall into this category. The computer science degree will be similar to the computer engineering degree in the first year, with students of both majors learning C++ and some hardware courses like embedded systems. 

The Pointer school then uses C++ for majority of the computer science courses, including the introductory computer science course. This means students learn about pointers and memory management very early on in their computer science degrees. 

Since low-level languages interact closely with memory, students also have to learn concepts like ending a string with `null`, number representations (like int and float), how to pass an array by reference, etc.

The course is modeled around the programming language, rather than the programming language being modeled around the concepts. As an example, in the first week students must learn data representation of integers and strings, as C++ is a low-level programming language. Concepts are more concrete rather than abstract, like learning about "nested loops". Someone learning functional programming wouldn't really need to care about how a integer is stored or whether they should use `u16` or `u32`.

Engineering schools usually start to turn into industry schools because they have to start differentiating computer science from computer engineering, and typically, there will be many industry/skills based higher level courses.

An engineering school equips students with a strong understanding of low-level concepts like pointers and memory management.

## The Functional Programming (Theory) School
Schools like UBC or NU fall into this category, and teach the introductory computer science course based on a systematic approach (Structure and Interpretation of Programs/HtDP) using a functional programming language. This systematic approach stresses "explicit and systematic approaches to program design"[^dd], rather than worrying about number representation, pointers and memory management that pointer/engineering schools would focus on. A functional programming paradigm is usually used because it's easier to reason about: no mutation, data and state are separate, and it looks similar to algebra (given an input, you get an output). There is a large emphasis on forming well designed and correct programs, using concepts like recursion which can be easily proved correct through induction. Whereas to prove a `for loop` is correct you require more steps.

Then looking at upper year offerings, NU has course offerings in Computer-Aided Reasoning, Complexity Theory, and System Specification, Verification, and Synthesis (to name a few). These types of courses are more of the "formal" and "mathematical" nature, and rarely offered to undergrads at other universities, including UBC! 

A theory school provides you with the theory you will need to go into grad school or research.

## The Java or Python (Industry) School
I first learned about the concept when reading a paper[^principles to practice] about using teaching languages to introduce objects and eventually OOP. While reading the references, I was intrigued by a blog post called "The Perils of JavaSchools"[^javaschool], which is where I learned the concept of a JavaSchool.

So what is a JavaSchool, or more generally an "industry" school? An industry school is one that teaches what is currently popular in industry. For the introductory programming course, a popular mainstream programming language like Java or Python along with a popular programming paradigm, such as object orientated programming is taught. Concepts like pointers or recursion are merely brushed over, or never even mentioned until the systems course or the algorithms course.

{{ quote(text="You may be wondering if teaching object oriented programming (OOP) is a good weed-out substitute for pointers and recursion. The quick answer: no. Without debating OOP on the merits, it is just not hard enough to weed out mediocre programmers. OOP in school consists mostly of memorizing a bunch of vocabulary terms like “encapsulation” and “inheritance” and taking multiple-choice quizzicles on the difference between polymorphism and overloading. Not much harder than memorizing famous dates and names in a history class, OOP poses inadequate mental challenges to scare away first-year students. When you struggle with an OOP problem, your program still works, it’s just sort of hard to maintain. Allegedly. But when you struggle with pointers, your program produces the line Segmentation Fault and you have no idea what’s going on, until you stop and take a deep breath and really try to force your mind to work at two different levels of abstraction simultaneously.",
author="Joel Spolsky",
link="https://www.joelonsoftware.com/2005/12/29/the-perils-of-javaschools-2/",
source="The Perils of JavaSchools"
)}}

I didn't choose to attend UofT and UofC for computer science because their websites were so confusing to navigate, but mainly because they were the industry schools that taught OOP using Python in the introductory computer science course, and many of their higher year courses didn't seem interesting to me. But they may seem interesting to someone more industry orientated.

Industry schools will also have upper year courses like "web development", "mobile development", or courses that are also business oriented. USC, UofT and NU have courses like this. 

With that being said, industry schools prepare you to with skills to write software, mainly web applications. You don't get too close with theory and you don't interact much with low-level languages. 

*This is how I would categorise the four schools I analyzed*
{{ blogImg(img="schoolRadarChart.png")}}

## Why make the distinction between "Pointer" and "Industry" School?
Computer engineering and computer science are frequently confused. Is the operating system more part of computer science or web development? Should computer science students learn how to interact with memory if they probably won't be writing code for Linux system calls? 

Computer engineering is more associated with how a computer works, down to the circuits and metal bits, in addition to assembly and C. Pointer schools which classify computer science as part of engineering will thus have their degree be included by the low-level nature of computer engineering.

On the other hand, an industry school sees computer science more for being software that has been created with high level languages like Java. Thus, these schools won't focus on low-level concepts that much, because Java, Python and JavaScript have abstracted away the details of memory. 

# Are Computer Science Degrees too Theoretical?
Time and time again I hear people complain that computer science degrees are useless. This probably occurs more at UBC than other schools because there aren't many courses that contain "industry skills" like web development. The only course that teaches web development technologies at UBC (CPSC 455)[^455] is only offered in the summer. UBC has many higher level theory based courses, like Definition of Programming Languages (taught in Racket), Introduction to Compiler Construction (which is applied because there's a project, but taught in (a functional paradigm) Racket, which students may feel is more "theoretical" than say using Python like UofT does), Numerical Linear Algebra, Computational Optimization and Advanced Algorithms Design and Analysis to name a few. There's three levels of "data structures and algorithms". Other universities usually only have 2. Besides the web development course offer in the summer, there aren't many courses that directly teach "popular and hot"\* industry skills at UBC.

\*There are game development courses at UBC, but most computer science students aren't interested in game development due to the lower end salary and grueling hours as compared to a Big Tech job.

Meanwhile, at USC, NU, and UofT there are many more courses that directly teach industry skills. At USC, there are courses called "Programming Graphical User Interfaces" and "Android App Development". Similarly, UofT has "Programming on the Web", "Designing Systems for Real World Problems", "The Business of Software". At NU, students can choose to make their degree more industry focussed or theory focussed, hence why NU is strong in both theory and industry in the radar chart above.

{{ blogImg(img="theory-vs-industry.png")}}

In regards to core curriculums, NU's is the most theory based. Students learn about the Turing thesis for instance, which none of the other 3 universities require. Next is UBC. UBC's intermediate data structures and algorithms course requires learning about NP and P. So does USC's[^270]. At UofT, P and NP is not part of the required data structures and algorithms course[^373]. Additionally, UBC's focus on a functional paradigm makes it more theory based than USC or UofT, which teach their introductory computer science course with an imperative and OOP focus. USC and UofT are close in terms of core curriculums, but UofT edges USC over theory based on computer science course offerings; UofT has more theory based higher level course offerings than USC.

Maybe you're wondering why there's so many differences in how universities teach computer science. Different schools can really offer a different computer science education to their students. Well I think it's because of the confusion of what computer science is.

{{ quote(text="there is a widespread belief that computing science as such has been all but completed and that, consequently, computing has 'matured' from a theoretical topic for the scientists to a practical issue for the engineers, the managers and the entrepreneurs, i.e. mostly people —and there are many of those!— who can accept the application of science for the obvious benefits, but feel rather uncomfortable with its creation because they don't understand what the doing of research, with its intangible goals and its uncertain rewards, entails."
author="prof. dr. Edsger W. Dijkstra",
link="https://www.cs.utexas.edu/users/EWD/transcriptions/EWD13xx/EWD1304.html",
source="The end of Computing Science"
)}} 

The question we need to ask then:

**Is the computer science degree for students who wish to pursue research in computer science to think of correct and novel ideas, or for the student who only cares about being correct and making money in the software industry?**

Currently, the computer science degree at many schools tries to do it all: prepare students for grad school and prepare students to create web applications. I don't think this is good because one area severely lacking in many computer science degrees (not in the curriculum or offered in higher level courses) is reasoning and formal verification of systems! Dijkstra also thought the same many years ago!

{{ quote(text="Until the end of his life, Dijkstra maintained that the central challenges of computing hadn't been met to his satisfaction, due to an insufficient emphasis on program correctness (though not obviating other requirements, such as maintainability and efficiency)",
author="Dijkstra",
link="https://en.wikipedia.org/wiki/On_the_Cruelty_of_Really_Teaching_Computer_Science",
source="Wikipedia")}}

I don't think universities are equipping computer science students to do research in areas like formal verification, dependent types and more. I also don't think computer science degrees are equipping students well for the industry either. There needs to be a different path for computer scientists and software developers, like there is for chemists and chemical engineers.

So is the computer science degree too theoretical? **If the computer science degree is to prepare students to do the hard work of thinking of correct and novel ideas in the field of computer, then no, the computer science degree is not too theoretical. It actually isn't theoretical enough.**


For instance, we can all agree that software is laden with bugs and as Dijkstra says: 

> On the contrary, most of our systems are much more complicated than can be considered healthy, and are too messy and chaotic to be used in comfort and confidence. The average customer of the computing industry has been served so poorly that he expects his system to crash all the time, and we witness a massive worldwide distribution of bug-ridden software for which we should be deeply ashamed.

Verifying programs is hard. I liken it to the production of drugs. It's one thing to discover something works, and it's another thing to synthesize that drug. Then it's another thing to learn how to synthesize that drug on a large scale as safely and effectively as possible. Without someone who understands the theory, you can't think of a way of making a drug. For instance, an novice drug chemistry student may find the formula to create a drug, and realise they have unfortunately created stereoisomers of the drug. But only one stereoisomer of the drug works; in most cases, the other stereoisomers are not effective or even harmful. There are ways to filter the products, but this means you waste around half of your products, which isnot good because many drug precursors are byproducts of the oil and gas industry[^benzene], so we don't have an infinite supply. This is a hard problem in chemistry, the solution being awarded a 2021 Nobel Prize in Chemistry[^lemon].

{{ blogImg(img="lemon.jpeg")}}

For a long time, drug makers were stuck having to filter out their products for the correct stereoisomer. After years of research, there are now ways to conduct "asymmetric organocatalysis", meaning you only create one stereoisomer. Similarly to program verification, we are stuck writing tests. But "testing cannot prove the absence of bugs it can prove their existence"[^bugs]. For now, we are just stuck testing and testing and hoping for the best, like the novice chemistry student was stuck just filtering out the products for the correct stereoisomer. 

But how can be achieve this ability to easily verify a program is correct? With research. Which requires a strong understanding of theory. Right now, formal verification is an "unmastered complexity". Many problems in computer science are an "unmasterd complexity".

> You see, while we all know that unmastered complexity is at the root of the misery, we do not know what degree of simplicity can be obtained, nor to what extent the intrinsic complexity of the whole design has to show up in the interfaces. We simply do not know yet the limits of disentanglement. We do not know yet whether intrinsic intricacy can be distinguished from accidental intricacy. We do not know yet whether trade-offs will be possible. We do not know yet whether we can invent for intricacy a meaningful concept about which we can prove theorems that help. **To put it bluntly, we simply do not know yet what we should be talking about, but that should not worry us, for it just illustrates what was meant by "intangible goals and uncertain rewards"**.

So how do we figure out the "limits of disentanglement" and "trade-offs"? By equipping students with the theory required to think of correct and novel ideas.

<center>✨</center>

[^think]: [How to Think for Yourself](http://www.paulgraham.com/think.html)

[^chem reddit]: [Chemical Engineering vs. Chemistry](https://www.reddit.com/r/chemistry/comments/3gi2wl/chemical_engineering_vs_chemistry/)

[^ubc materials engineering]: [Department of Materials Engineering:Course lists and descriptions](https://mtrl.ubc.ca/undergraduate/current-students/course-lists-and-descriptions)

[^materials atomic bonding]: [Bonding and Properties](https://docs.google.com/viewer?a=v&pid=sites&srcid=dWJjZml6ei5jb218d3d3fGd4OjNiODY2ZmQ0MGM4NzMyYTM)

[^412]: [CHEM 412](https://www.chem.ubc.ca/chemistry-412-structure-atoms-and-molecules)

[^312]: [CHEM 312](https://www.chem.ubc.ca/chemistry-312-introduction-quantum-mechanics-and-spectroscopy-15)

[^usc courses]: [USC Computer Science Courses](https://classes.usc.edu/term-20223/classes/csci)

[^ubc courses]: [UBC Computer Science Courses](https://courses.students.ubc.ca/cs/courseschedule?pname=subjarea&tname=subj-department&dept=CPSC)

[^uoft courses]: [UofT Computer Science Courses](https://artsci.calendar.utoronto.ca/section/Computer-Science)

[^uoft cs]: [UofT CS Curriculum](https://artsci.calendar.utoronto.ca/section/Computer-Science#programs)

[^usc cs]: [UST CS Curriculum](https://www.cs.usc.edu/academic-programs/undergrad/computer-science/)

[^ubc cs]: [UBC CS Curriculum](https://www.calendar.ubc.ca/vancouver/index.cfm?tree=12,215,410,421)

[^nu cs]: [NU CS Curriculum](https://catalog.northeastern.edu/undergraduate/computer-information-science/computer-science/bscs/#programrequirementstext)

[^principles to practice]: Tobin-Hochstadt, S., & Van Horn, D. (2013). From Principles to Practice with Class in the First Year. Electronic Proceedings in Theoretical Computer Science, 136, 1–15. doi:10.4204/eptcs.136.1

[^javaschool]: [The Perils of JavaSchools](https://www.joelonsoftware.com/2005/12/29/the-perils-of-javaschools-2/)

[^102]: [CS102](https://ee.usc.edu/~redekopp/cs102/Fa21Syllabus.pdf)

[^108]: [CSCI108](https://www.cs.toronto.edu/dcs/ugdocs/course-outlines/2021/Fall/CSC108H1-Fall2021.pdf)

[^110]: [CPSC110](http://cs110.students.cs.ubc.ca/syllabus.html)

[^dd]: [Developing Developers](https://felleisen.org/matthias/Thoughts/Developing_Developers.html)

[^uoft compilers]: [CSC488](https://www.cs.toronto.edu/~pdm/csc488/winter2019/assignments/a3.html)

[^ubc compilers]: [CPSC 411](https://www.students.cs.ubc.ca/~cs-411/2020w2/)

[^455]: [CPSC 455](https://courses.students.ubc.ca/cs/courseschedule?sesscd=S&campuscd=UBC&pname=subjarea&tname=subj-section&sessyr=2022&course=455&section=901&dept=CPSC)

[^373]: [CSC373](https://www.cs.toronto.edu/~nisarg/teaching/373f19/schedule.html)

[^270]: [CSCI270](https://viterbi-web.usc.edu/~shaddin/cs270sp16/index.html#:~:text=The%20course%20CSCI%20270%20provides,NP%2Dcompleteness%20and%20computability%20theory.)

[^science]: [What Makes it Science](https://bentilly.blogspot.com/2009/09/what-makes-it-science.html)

[^lemon]: [2021 Nobel Prize in Chemistry](https://www.nobelprize.org/prizes/chemistry/2021/press-release)

[^bugs]: [Tests Cant Prove The Absence Of Bugs](https://wiki.c2.com/?TestsCantProveTheAbsenceOfBugs)

[^benzene]: [Benzene](https://emergency.cdc.gov/agent/benzene/basics/facts.asp)
