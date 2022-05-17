+++
title = "Comparisons of how CS Courses are taught at UBC"
date = 2022-04-23
draft = false
updated = 2022-05-16
+++

*Disclaimer: I'm just a student and teaching assistant for the courses I will be talking about.*

This post was inspired by Amy J. Ko, Ph.D.[^amy], [Critically Conscience Computing](@/blog/papers/compsci/cs-edu/ccc.md)[^ccc], and the talk (also by Amy) Learning to Code: Why we Fail, How We Flourish[^ltc].

---

More and more students use a computer in their daily lives but have little to no understanding of the inner workings of computers, models of computation, or computer programs. Using a computer is like riding the bus; it's just how life is. You may use Google Docs because your school requires you to. Ignoring the capitalistic argument for pursuing computer science, I don't think many students are passionate or enjoy learning about computer science solely to just learn how a computer works. Rather, students want to learn about the vocational skills associated with computer science, while ignoring the theory. That may be because the link between computer science and society, or the impacts of computer science (besides Big Tech and AI, where there's a lot of money involved) is hard to see.

If we look at other sciences, like math or chemistry, the students in that major are more passionate about what they are studying. For example, chemistry is a large field, and as a chemistry major, you're required to take chemistry courses in a range of topics such as organic chemistry, quantum chemistry, physical chemistry, inorganic chemistry, etc. A chemist should have a basic understanding of the range of topics in chemistry because many areas involve more than one specialty. I've rarely witnessed students complain in my chemistry classes about a certain topic being "useless" because most students appreciate that a good chemist understands a wide range of areas in chemistry. Of course, someone may be more interested in applying chemistry, rather than learning the theory and engaging in research. For them, a degree in chemical engineering (which I've heard is very different) could be a better fit. 

But it's different in my computer science classes. I see and hear frequent complaints about how a student will "nEvEr tOuCh hArdWarE aGAiN" and that they just "hope to pass" a course to graduate and move on to their Big Tech™️  job. Then there are students who complain that a computer science degree was "useless" for their job in web development because they weren't taught React, JavaScript, and other web technologies. A good computer scientist will, like a chemist, have a basic understanding of a wide range of topics. Unlike the chemical engineering degree, there's no "Software Engineering" discipline in most Canadian universities. There's only computer engineering and electrical engineering, which most computer science students would stay far away from since so many of them dislike hardware so much. There seems to be a large distaste for hardware from most computer science students. Anyways, this begs the question, of whether there should be another degree or "pathway" for someone that just wants to do web development, as that is what most software jobs are these days. Most software jobs seem to stress vocational skills, but computer science degrees in Canada are very theoretical.

With that being said, a computer science degree is still the most common degree for a software job. Since software is such an important and overreaching part of society, and I believe that just vocational skills aren't enough to get a job in software, because you must understand why something is the way it is or how something could fail. Nonetheless, a job as a software engineer requires coding and learning various technologies, with less emphasis on theoretical topics commonly taught in university. Should that be the responsibility of the university to teach these technologies over concepts? I'm not sure. But nowadays Canadian universities are teaching a mix of both for computer science, though much more emphasis on theoretical concepts. But how do we best teach theoretical concepts alongside programming language skills and proficiency?

# How do we best teach theoretical concepts alongside programming language skills and proficiency?
Educators like Amy J. Ko, Ph.D. hope that more people, especially from minority groups, can get involved in computer science. However, it's a challenge: even though there are more women in other areas like medicine and business than in previous years, you can't say the same for computer science. Researchers from UCLA[^ctc] have pointed out: 

{{ quote(text="Women who take intro-to-CS classes tend to be further along in their college careers than men, and they are usually not CS majors. Since women are better represented in CS intro courses (32%) than among actual CS degree earners (16% among BRAID schools), BRAID researchers believe that CS intro classes are particularly significant in whether a student chooses to go down the CS pathway.

[...]

Lehman stresses that students’ first impressions about CS are shaped by these introductory classes, especially because women, on average, are less likely to have taken a CS class in high school.

[...]

When it comes to programming, you first have to master how to learn programming, Lehman said. “So if [an instructor] just assumes that all the students have some background in coding, it can put some students at a disadvantage.”

[...]

Female students in these classes may also be made to feel as if they aren’t allowed to make mistakes.",
author="Shana Vu",
source="Cracking the code: Why aren't more women majoring in computer science?",
link="https://newsroom.ucla.edu/stories/cracking-the-code:-why-aren-t-more-women-majoring-in-computer-science")}}

Another interesting point made by the researchers that I identified with was that:

{{ quote(text="“If someone stays in the major, it’s usually because they have strong peer connections,” she says. “When they leave, it’s not because they’re not capable, but it’s typically because they have this idea that CS does not contribute to the social good, and they want to help people.”",
author="Shana Vu",
source="Cracking the code: Why aren't more women majoring in computer science?",
link="https://newsroom.ucla.edu/stories/cracking-the-code:-why-aren-t-more-women-majoring-in-computer-science")}}

This is one problem computer science educators are trying to solve: how do we relate computer science to a student's life? How do we show that computers can contribute to the social good? How can we make computer science personally resonate with a student?

A student's first exposure to computer science is usually through programming. Most computer science courses you take will have a programming component, as did my first computer science course. However, in CPSC 110, I couldn't understand or see why learning recursion or coding up binary trees related to anything! After my first year, I was ready to leave my major in computer science for one in chemistry, where I had a dream of discovering drugs to cure diseases. Unfortunately, many other people may experience the same feeling of being divorced from their studies in computer science. 

In [Critically Conscience Computing](@/blog/papers/compsci/cs-edu/ccc.md), Amy J. Ko, Ph.D. talks about several ways programming is usually taught, and the positives and negatives of the different methods. Having TAed CPSC 110 and CPSC 210, and [taken some computer science courses](@/blog/courses/_index.md), I've noticed some differences between how programming is taught, and thus the differences in students' reactions to the course. 

CPSC 110 and CPSC 210 are based on teaching students a type of programming paradigm. In CPSC 110, students are taught to think in a functional paradigm, while in CPSC 210, students are taught to think in an object orientated programming paradigm. Both courses tackle teaching students how to program in a particular paradigm with a different method: CPSC 110 uses problem sets and labs while CPSC 210 uses a self driven project and labs. I'll be discussing problem sets and self driven projects.

## Problem Sets
After students go to a lecture, they must practice the knowledge they have learned to understand how to apply it. Simply reading or watching someone code does not imply a student can also code. The most common, consistent, and probably the easiest way to teach programming is through problem sets. Professors can also easily evaluate a student's ability to program through problem sets. Problems sets are also an easy way for an instructor to see a student's struggles and progress during a course because problem sets can be issued after every lecture, or at some consistent time interval, with questions targeting specific concepts or lectures. 

Most courses at UBC use problem sets to evaluate a student's understanding of course content. I'll define a problem set as a set of problems that every student works on, and there's usually one solution that the professor is looking for, though a few alternatives exist. There are usually some "test cases" that have to pass. There's some implementation freedom in a student's answers, but they must pass these "test cases".

CPSC 110 uses problem sets to judge a student's ability to do domain analysis and to apply the appropriate template to a particular problem. Students don't just get to pass the test cases though! There's a human graded portion and students are called up at least once throughout the term to discuss their solutions with the TAs.

Since students will all do the same problem set, this ensures some level of fairness, since all students will be answering the same problems. However, as [Critically Conscience Computing](@/blog/papers/compsci/cs-edu/ccc.md) mentions, problems sets may be divorced from someone's life. Most problem set questions may involve questions like "Traverse a tree numbers" or "Generate all the possible outcomes for a set of clowns". If a student is not intrinsically already interested in computer science, these types of questions in problem sets are usually divergent from a student's interests and may make them less interested in computer science as a whole. I experienced this same feeling. I couldn't see or understand how these problem sets would give me skills to contribute positively to society.

{{ quote(text="Finally, because problem sets are often divorced from students’ lives, many students struggle to find a relationship between the abstract ideas of programming languages and their interests, values, and passions, limiting their motivation to learn.",
source="Critically Conscience Computing",
link="https://criticallyconsciouscomputing.org/languages",
author="Amy J. Ko, Brett Wortzman") }}

While problem sets ensure a student is up to a standard of knowledge (if they can complete the problem set correctly, this means they have understood most of the material), they can feel rigid and impersonal to a student. Something even worse is that students, especially women, could struggle on a problem set and decide that since they struggled so much solving questions on a problem set they didn't feel any personal connection to, to not pursue any further studies in computer science (that was I how felt my first year of university).

{{ quote(text="The result of this approach is that students often rapidly lose any self-efficacy they began with, struggling to design, test, and debug without guidance, often converging towards a fixed mindset that they were simply not a “born” programmer",
source="Critically Conscience Computing",
link="https://criticallyconsciouscomputing.org/languages",
author="Amy J. Ko, Brett Wortzman") }}

During my time TAing CPSC 110, students who struggled usually continued to struggle throughout the term. Students aren't allowed to discuss or ask about problem sets to TAs or other students, meaning much of the problem set must be solved by themselves, without much guidance. Thus, students who struggled on the first problem set usually struggled on the next and the next ones, with some students eventually dropping the course.

A possible solution to helping students' feel more personally engaged with programming is to center a course around being project-based, which I will discuss below.

<details open>
<summary class="noselect">
An Aside
</summary>

Amy J. Ko, Ph.D. also discuss how students may have a brittle understanding of the programming language, further impeding their ability to complete problem sets. I think that CPSC 110 tries to remedy this problem by using BSL (and later ISL and ASL), a small teaching language with a simple syntax and grammar designed for educational purposes[^dd]. The design of BSL is intentional such that all the features of BSL are all the features a student needs at a current stage in the course. BSL is then extended to ISL to include new concepts the student is learning. New data structures are introduced in lecture then introduced in the programming language. An example is `cons` and `list`. Students first learn to structure arbitrary sized data using `cons` in BSL. Then in ISL, they can use syntactic sugar `list`!

Some reasoning behind choosing a programming language for a course from Matthias Felleisen, creator of HtDP which CPSC 110 is based on: 

{{ quote(text="
When it comes to choosing a language for the first course, we must take into account the above goals and two relevant theorems:

**Theorem 1** Novice programmers make mistakes.

**Theorem 2** A compiler and the run-time system articulate error messages under the assumption that the programmer knows the entire language.

These theorems have three immediate consequences relevant to Fundamentals I:

**Corollary 1** An introductory course cannot serve a wide spectrum of complete novices if it uses an off-the-shelf (industrial) language.

Examples of ill-suited languages include C++, Java, JavaScript, Python, Racket, and Scheme—even though they are, or were, used for first courses. Pascal is also too large, even though Wirth explicitly motivated Pascal as a “small teaching language.”

**Corollary 2** Reducing the size of the language improves its error messages.

**Corollary 3** An introductory course needs a series of small languages that suffice to illustrate the design recipes.",
link="https://felleisen.org/matthias/Thoughts/Developing_Developers.html",
source="Developing Developers",
author="Matthias Felleisen")}}

To put it briefly, programming languages like C require an understanding of pointers and memory management, before doing something like working with arbitrary sized data. Even with a higher level programming language, industry languages (like Java and Python) have too many features and confusing error messages, which can overwhelm students who have never programmed before.
</details>

## Project-based courses
Project-based courses aim to offer a personalized and individualized component for the student. Students can conceptualize their project, usually adhering to some rules that require using a certain programming language or implementing concepts like object-orientated design. 

In CPSC 210, students were very excited to discuss with me what they wanted to build. This is probably one of the most exciting things about computer science: building things! My office hours also felt different in comparison to CPSC 110. During my TA office hours, students also came to me to fix a bug in a feature they were implementing. They talked about "fixing the bug that adds something twice to my shopping cart" rather than "I don't understand how recursion works."

{{ quote(text="This approach overcomes many of the problems of direct instruction, because when students encounter problems with their programs, students might see those problems as authentic challenges of realizing their vision, rather than failures to meet a rigid, instructor-defined notion of success. There is substantial evidence that student-driven project-based learning greatly improves interest in CS, motivation to learn, and engagement, and some evidence that this is associated with increases in student learning of programming language concepts.",
source="Critically Conscience Computing",
link="https://criticallyconsciouscomputing.org/languages",
author="Amy J. Ko, Brett Wortzman") }}

However, students who are "beginner", meaning they didn't program outside of university, have the extra challenge of learning a programming language, in CPSC 210's case this would be Java. Coupled with the freedom of designing their own project, this can cause a project to flop.

{{ quote(text="Because students creatively explore their vision by modifying code, this brittle understanding of a programming language’s rules may also make it harder to change a program, because students may not understand precisely how their code is executing, limiting a students’ ability to realize their vision. Finally, and perhaps most significantly, because learning new programming language features is difficult, students with a fixed mindset may start with elaborate visions, realize that they have to learn particular language features, and then reduce their vision to avoid learning.",
source="Critically Conscience Computing",
link="https://criticallyconsciouscomputing.org/languages",
author="Amy J. Ko, Brett Wortzman") }}

Over my two terms TAing CPSC 210, I've always witnessed a student's vision for their project become less and less than what they had described to me. Many students begin designing their projects before having an adequate understanding of the programming language they are using, so many students inevitably overshoot and overcomplicate their projects. Of course, many of us over estimate what we can do, but for a student who is new to programming, this can mean that a student simplifies their program based on the level of their understanding of the programming language, resulting in "superficial programs that, while enabling students to express their interests to some extent, do not necessarily result in a robust or comprehensive understanding of a programming language, ultimately limiting their learning"[^ccc].

Having marked over 100 student projects, I have observed many students' progress in learning OOP and Java throughout the course. Since projects are usually larger assignments, students will get the entire term to work on them. But unlike a problem set with clear questions that point you towards what concepts you should be applying, a project, self-guided by the student, doesn't hold this same rigor. Even though students learn about Maps, they may just stick with two arrays, because they know how arrays work. I will usually not see students apply many of the new concepts they have learned in lectures. This troubles me because then I'm not sure if they will be able to apply these concepts in higher year courses. Another crucial concept of OOP includes Design Patterns, which students were encouraged to implement in their projects. However, since many students had working code without design patterns, many chose to not try and add a design pattern to their project. However, shouldn't grading catch this? 

But it's also hard to grade a project, depending on how much creativity was allowed. For some projects, like a library system, the most complex data structure required is an array or linked list. For but a toy file system, someone may have used an n-ary tree. But should the array user student get a lower grade than the n-ary tree student? For CPSC 210, this meant grading was very lax, allowing students to get very high marks based on a very bare-bones rubric, which masked their lack of understanding of the course content. The grading rubric was so forgiving that projects with differing levels of complexity and concepts from class in them were given the same mark.

I have witnessed that students enjoy CPSC 210 more than CPSC 110. However, should student enjoyment be prioritized over knowledge acquisition and knowledge application? Is it okay that students leave the course with different levels of knowledge?

Project-based courses that have stricter rubrics or are "pre-designed" by the professor seem to be able to rectify issues like inconsistent projects between students and ensure all students are applying the same concepts learned in the lecture. But this then removes the creativity aspect of projects, which can make students feel the same way they did with problem sets.

<details open>
<summary class="noselect">
An Aside: Programming languages as vessels to teach concepts?
</summary>

Something I've noticed in all my computer science courses is how "programming languages are vessels to teach a concept". This means the course doesn't focus on all how a programming language works, the semantics, and the rules. It seems to be the idea that students are either able to quickly pick up the programming language or that they are supposed to learn the programming language outside of class.

However, it's difficult for some students to understand a concept and apply it because they have the barrier of also learning the programming language. I nearly failed an assignment in my data structures and algorithms course because I was having so much trouble with C++. I didn't understand how memory was being allocated and freed and how to use pointers. But did this mean I understood the concepts? I'll never know.

For chemistry courses, we have dedicated lab instructors teaching us laboratory concepts. But in computer science, students are left to themselves to learn and understand a programming language. CPSC 110 had lots of active programming in lectures and TAs who would catch people who were just passively watching without coding on their laptops. In other courses, the instructional team didn't care what students were up to during class.

Professors inevitably need to choose a programming language to use as a vessel to teach a concept, but having to program in a new programming language can make someone believe they aren't understanding the concepts, ultimately making them believe they aren't good at CS.

Not teaching the programming language students must use can leave students feeling like learning a new programming language is supposed to be easy (hence no time spent on it in class) or simply cause a student to fall behind because they don't have the time to learn a new programming language in addition to completing assignments.

</details>

# Some more thoughts on problem sets vs. projects
A problem set and a project can be defined in terms of two types of freedom. Implementation freedom, which is the "how" a program does something, and design freedom, which is "what" a program does.

The problem-set would have little to no design freedom and any degree of implementation freedom. Some courses emphasize only getting the right result, meaning lots of implementation freedom, whereas other courses, like CPSC 110, will pay attention to implementation details, so there is less implementation freedom.

A project-style assessment has any degree of design freedom, and any degree of implementation freedom. The implementation freedom could depend on the design or "what" the program does.

Another difference between problem sets and projects is that projects are long-term pieces of code. How a student performs in an earlier problem set probably doesn't affect their performance in a later problem set. Students can start from a "clean" slate for each problem set. But if a student decides to poorly put together parts of their project, they can shoot themselves in the foot if they need to understand these parts a few weeks later, or realise later that the poorly implemented parts of their projects are buggy. Essentially, projects also teach students how to plan and manage code over a long period. Early computer science students have difficultly reasoning about programs, especially in a language like Java that has many features and confusing error messages, which can make project-style assessments difficult, leading to the issues mentioned above.

The distinction between a problem set and project can be blurred, but the main difference is the potential for some more design freedom and the long-term nature of a project.

## How much design freedom should be allowed to avoid issues associated with problem sets? 
Determining how much design freedom to allow is a hard question, especially in introductory courses where there are many beginners. Strong students probably don't care about design freedom because they have other factors for pursuing computer science. To have more design freedom, I would also hope to avoid the issues with design freedom, such as students over overcomplicating or under complicating their design, by having more TA support. TA support could include having explicit meetings between students and TAs. During the meetings TAs evaluate the student's design and be honest and knowledgeable enough to see when a student is struggling and think of the right course of action. A way to introduce some personalization to a problem set could to to let students to define a part of the problem statement. 

## A Fixed mindset vs. Growth mindset
More difficult and abstract problem sets can be viewed as a opportunity to learn by a strong student (growth mindset), and a challenge that will cause struggle by a weaker student (fixed mindset)[^fix vs grow]. I don't think problem sets should become easier, because computer science is about coming up with solutions around abstract problems and upper year courses will also be difficult. It doesn't do the student any good to be "babied". The course cannot constantly and always provide motivation, which means motivation and a connection to computer science has to be provided early in the course or elsewhere, such as through clubs or advising. 

Finding ways to motivate and help students in computer science courses is a hard problem to solve and more pronounced in computer science because students come from so many different backgrounds and have differing levels of preexisting knowledge. This paper shows that an educator suggests "we should not teach and assess everyone in the same way"[^fix vs grow]. Unfortunately, teaching everyone at the individual level is impossible.

## Freedom of designing your own project
The freedom of open-ended projects is a double edged sword. When students change their vision due to difficulties in learning a hard concept, seeing another student be able to implement that hard concept could be a blow to their self-esteem and interest in the subject. Problem sets allow students to identify where they struggled, which give them an idea on how to improve on later problem sets. However, projects can amplify and compound a student's struggles, as a student's previous code choices will impact future code choices. Students don't properly verify code is bug free and ensure code does what they want it to, because it's harder to spot mistakes with so much freedom, even for a TA (a TA may not understand the student's vision or misinterpret it). This then results in a student creating a subpar project, which they then may compare to their peers' projects. But even in the case a student does understand concepts and has implemented them in their project, they might just feel "behind" because their project is simpler than their peers' or up to their initial vision. Due to the freedom of self-driven projects, students create projects with differing levels of complexity, and by comparing projects with peers, this can potentially cause some students to feel inferior. While projects can give students a sense of pride when they demo them to each other, they can also become points of comparison among peers.

There may also be limit to how helpful design freedom is for garnering interest. Students start out with a "high" since they are so excited when planning out a project, and then that "high" can drastically decrease as they begin implementation and start facing issues. And even worse, whatever interest the student has could decrease further when they compare themselves to "higher-performing" students.

*Thanks to [Alex](https://github.com/ADSteele916) for pointing out my misinterpretation of why BSL is used in CPSC 110 as well as general feedback and new points.*

<center>✨</center>

[^amy]: [Amy J. Ko, Ph.D.](https://faculty.washington.edu/ajko/)

[^ccc]: Amy J. Ko, Anne Beitlers, Brett Wortzman, Matt Davidson, Alannah Oleson, Mara Kirdani-Ryan, Stefania Druga (2022). Critically Conscious Computing: Methods for Secondary Education

[^ltc]: [Learning to Code: Why we Fail, How We Flourish](https://www.youtube.com/watch?v=mkzHIhKaUX4)

[^ctc]: [Cracking the code: Why aren't more women majoring in computer science?](https://newsroom.ucla.edu/stories/cracking-the-code:-why-aren-t-more-women-majoring-in-computer-science)

[^dd]: [Developing Developers](https://felleisen.org/matthias/Thoughts/Developing_Developers.html)


[^fix vs grow]: [Folk Pedagogy and the Geek Gene: Geekiness Quotient](https://dl.acm.org/doi/10.1145/3017680.3017746)



