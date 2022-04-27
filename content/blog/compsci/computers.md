+++
title = "Computers are cool!"
updated = 2022-04-26
date = 2022-04-01
draft = false
+++

I grew up right when social media was just starting to exist. I had to fight my dad to get an email and didn’t even do anything with the email once I got it. Computers weren’t part of my life like reading books was. I didn’t notice or care about computers. 

But computers are now everywhere in society; cars, phones, traffic lights, dishwashers, to just name a few. 

Computers are complex and do many amazing things. It’s easy to view computers as magical. But they aren’t as magical as they seem. Did you know the first computer included wood parts and always broke? Computers were (and are) ever-evolving, which I think is amazing.

{{ blogImg(img="wood.png") }}

Some questions I've had about computers are:

1. What is a computer?
2. How does a computer work?
3. What are the ethics and history of computers?

## What a is computer? 
I think computers are perhaps a combination of mathematics, physics, and chemistry. 

### Mathematics
Computers do computing (obviously). 

**What's computing?**   
Computing is the act of performing mathematical or procedural tasks. You don’t need code to compute; all humans can compute! 

Computing is already taught as basic mathematical skills, like learning your time's tables and doing calculations by hand. In university, you then learn it again when you learn about binary and hexadecimal. 

Computing also involves the application of algorithms. How would you introduce an algorithm without code? It can be as simple as telling a group of students to sort themselves (based on height) using a sorting algorithm like bubble sort or merge sort. Then you can ask the students their observations on the different algorithms. 

A computer seems like it’s just doing magic, but it’s computing. The first computers were people (mostly women) during WWII, where they calculated the correct coordinates for projectiles. The abacus can also be seen as a computer, one of the first computing tools created by humans.

Many emerging curriculums seem to be focusing a lot on teaching computing. If you want to learn more about computing, I recommend watching videos from [Simon Peyton Jones](https://www.youtube.com/watch?v=Ia55clAtdMs). 

Computers do millions of mathematical operations a second to display pictures on your screen and interpret signals from your keyboard. Humans have placed a lot of trust in computers being correct when doing math. And this trust has led to [catastrophe](https://www.bbc.com/future/article/20150505-the-numbers-that-lead-to-disaster). With the increasing use of computers to do calculations for us, it is imperative to teach students that computers are finite while mathematics is infinite. A computer is a handy machine, but that piece of metal cannot store all digits of pi. When dealing with irrational numbers, computers must always round. When you’re finding the area of a circle for math class, rounding errors are almost negligible, but for space operations, these errors can be much more catastrophic. 

### Physics [todo]
Physics because of the transfer of information and instructions through electrical signals. 

### Chemistry [todo]
Chemistry because of the special qualities of metals, rare earth metals, and silicon makes these elements the perfect medium for computing, as well as oxidation and reduction reactions that make batteries work.

## How does a computer work?
Even in my university classes, many students don’t recognize that someone, human, like us, designed the computer the way it is today. The use of QWERTY keywords isn't a phenomenon like gravity, it was a design choice. Someone is making these choices, and we should learn about these choices because there can be small and large consequences if we don’t. 

Obviously, computers are elegant, complex and sometimes (but mostly always) confusing to understand. But there are 4 "parts" that when put together, allows a computer to work.

1. Operating System
2. File System
3. Memory
4. Programming Languages

### You better trust your operating system! 
The computer's operating system is it's control center, a collaboration between software and hardware. Every program, except the operating system itself (which is also a program) is managed by the operating system. A computer has limited memory, and every program wants that memory! The computer also can't do everything at once. How does a computer make sure each program gets to run and that each program gets the memory it needs? The operating system. The operating system is also like a security guard; it makes sure the memory given to a program is memory that program is allowed to either read, write or execute. When memory runs out, which it will, it is up to the operating system to choose which program loses it's memory to give to the other programs.The operating system also ensures programs don't use each other's memory or try to steal teach other's information.

But operating systems weren't always made up of metal and circuits. Operating systems were human! Humans would sit in giant rooms and enter in programs and make sure programs had enough memory to run and didn't access the information or memory of another program. Obviously, humans sleep, so that meant a computer wasn't able to run all day. Eventually, human operators were replaced with the operating systems we use today, such as MacOS, Windows and Linux. 

A human operator probably couldn't and wouldn't try to read the data associated with a program. But since modern operating systems are fast to use, companies can easily add in tracking devices to monitor what goes on in your operating system, in addition to forcing you to use certain types of software (cough cough Microsoft).

The operating system you are using today not only determines how fast your applications are or how many you can open at once but also which tech company you’re giving your personal information to. Companies want your data and people should understand what this means. 

### A misunderstanding/lack of understanding of a file system
As a Teaching Assistant, something I was surprised to see was how unfamiliar students were with their file system. When I was evaluating final projects in CPSC 210, I would try to run a program, only to see an error saying that a necessary file was missing. When I approached the student about the error, many would show me their program working perfectly fine on their computer.

What happened was that the student was not checking if the project files were the same on their local machine and GitHub. Since I don’t have access to their local machine, I would retrieve the code from GitHub and run it on my machine. However, some files would still be on their computer, usually in the Downloads folder. Since the Downloads folder was not part of their [git](https://git-scm.com/)-tracked directories (essentially, git was not checking the Downloads folder to see if a new file was added), students would tell me “git didn’t tell me to commit this file”. Other similar issues involved the file existing on a student’s Desktop folder, which was also not tracked by git. Another related issue included the use of hard links like “/usr/lucy/myproject/code.java”, which only exists on Lucy’s computer, not Bob’s. All these mistakes involve a misunderstanding or lack of understanding of how a file system works. 

When I ask a student to find their project on their file system, many times, students respond with “what’s the file system” or tell me they have no idea where their project is. Honestly, the first few times I received questions like these I was surprised, but then I started to wonder why students were so unfamiliar with their file system. Even with personal computers becoming more and more common, there are a growing number of students who don’t understand or misunderstand how a [file system works](https://www.theverge.com/22684730/students-file-folder-directory-structure-education-gen-z). I believe that if students were taught about how a computer manages files, which is similar but also different from how a librarian manages books, as part of their elementary or secondary education, I’d be receiving a lot fewer questions about file systems. 

### How memory works [in progress]
Another concept that I also recently learned was about how a computer writes data. When you delete a file or an important pdf, you would probably think it’s gone from your computer. However, in most cases, your deleted file is still there, until it gets overwritten.  All your computer does is keep track of memory that has information the user thinks is important, like a file that they saved. When a user deletes a file, the computer simply marks the area in memory, and information encoded by that memory, as information the user doesn't care about anymore. When you save a new file, the computer will overwrite that area in memory.

This means after you throw away your computer, you could still have important information on you computer that you meant to delete from the world! Someone could mount your file system and gain access to sensitive information. Again, this would have been something students should learn about. 

{{ blogImg(img="data.jpg") }}

Learning about computers should be part of standard education because computers are everywhere and used by most people who have no idea how a computer works. Education should not purely serve to equip a group of people with skills for a career. Education is to help people understand the world around them. This is why we learn science in elementary school. While one can get through the world without understanding Newton’s Laws, acid and base theory, and cell biology, it can deepen your understanding of the world. When computers were only for government officials and university professors, it would have been pointless to teach the general public about computers. But now knowledge of computers should be taught to everyone. 

### Programming, or talking to your computer? 
Last but not least, is programming languages. A programming language such as C will compile down into byte code that your computer then runs on. There's a lot of programming languages, and each programming language has its place. Some programming languages like C and Rust are fast, so they are used in applications that we want to be really fast, like an operating system or video game. But C has it's own disadvantages, such as lack of many safety checks, which leads to many bugs like integer overflow. Other programming languages like Haskell are typed, meaning they use type systems to ensure code conforms to certain rules, kind of like a contract. Critical applications like banking applications might choose Haskell to ensure safety, while sacrificing speed.

## What are the ethics and history of computers?
There's a bunch of origin theories on how eukaryotic cells evolved from a symbiotic association of prokaryotes. But computers don't have any origin theories because computers were invented and created by many humans for many reasons! While we have no clear idea of how cells gained mitochondria, we do know computers were made by many humans, with their own goals and aspirations for what a computer should be. Babbage wanted to create a computer to replace human workers, while Lovelace and Turing were simply passionate about the mathematics and logic behind computers. The idea of replacing human workers with computers persists even stronger today. 

[Critically Conscious Computing](https://criticallyconsciouscomputing.org/) gives a wonderful overview of the ethics and history of computing, whether it be how algorithms can oppress,  or how the first computers and operating systems came about. [Design Justice](https://design-justice.pubpub.org/) also gives insight into how choices can harm individuals, and lastly, [Programmed Inequality](https://mitpress.mit.edu/books/programmed-inequality) discusses how women helped create the field of computing and computers, only to be forgotten as computing turned into a male dominated field. These books and their authors explain the area of ethics and history much better than I can in a blog post. I highly recommend you read their works. 

References and inspiration:
- [Critically Conscious Computing](https://criticallyconsciouscomputing.org/)
- [FILE NOT FOUND](https://www.theverge.com/22684730/students-file-folder-directory-structure-education-gen-z)

