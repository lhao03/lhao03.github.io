+++
title = "My issues with Learn to Code"
updated = 2022-04-26
date = 2022-04-01
draft = false
+++

I recently wrote a [rant-like post](@/blog/compsci/cs-edu.md) about my thoughts on my path to CS. Since then, I’ve been thinking about how I was first introduced to computer science when I heard the phrase “Everyone should learn how to code”. The more I think about this tech marketing mantra that has been screamed at me from every coding boot camp, online MOOC, and even President Obama, the more and more I disagree with it. 

{{ blogImg(img="coding.png") }}

# Does that mean Lucy doesn’t like coding?
This article isn’t saying that we should not teach coding at all. Coding (or programming) is a mechanism to make a concept in computer science tangible or realizable. I’ll use a metaphor using concepts in chemistry. In organic chemistry, you study many reaction mechanisms to understand why some reactions go forward to produce the desired drug, while other reactions are futile. But being able to predict which product a reaction mechanism will produce is different from actually extracting the end product in a lab. In the lab, you need skills like pipetting, visual cues, knowledge of proper reactant ratios, how to extract and preserve the end product (you can’t just leave it in the reactant solution!), and more. Without these lab skills, it doesn't matter how good you are at organic chemistry, because you can’t even make the damn molecule. 

Similarly, in the classroom, you might learn about tree traversal algorithms, the concept of allocating and freeing your memory, and how to prove your algorithm is correct and will produce the desired output, much like coming up with a reaction mechanism that produces the drug you want. But coding this algorithm requires you to understand, given whatever programming language you use, how to get that programming language running in the first place, the syntax rules (semicolons or parens?), how to spot and fix memory leaks, how to spot dangling pointers and more. Watching a video on pipetting doesn’t make you an expert at pipetting, just like how watching someone correctly implement an algorithm in C or Python doesn’t make you an expert coder. 

But coding and pipetting are simply skills for different jobs. If you want to work in a chemistry lab, you will need lab skills. Similarly, if you want to become a software engineer, you'll need to code. This doesn’t mean coding is something everyone needs to learn, just like everyone doesn’t need to learn how to pipette because not everyone is not going to be producing drugs or programming applications. 

Maybe you argue that coding will become a part of everyone's jobs, but I don’t think this will happen. More likely to occur is that computers will become a part of everyone's jobs, but people don't need to know or understand C to use a computer. This is because software engineers will hide the coding details away into nice and easy-to-use user interfaces. When you drag a file into a folder, there is code being executed to signal to your computer that this file is in a new folder. But you didn’t have to get down and dirty in the code. All you have to do is use your mouse to drag the file over. 

# How did "Learn to code" come about?
But before I get into why everyone should learn about computers, I wanted to explore deeper into this “Learn to Code” movement. 

## How "Learn to Code" got me into computer science
I have loved chemistry since I was 13, maybe you could have guessed from the chemistry metaphor. I never cared about getting a high-paying job until I was applying for universities and realized you couldn’t get paid much for having a Bachelor's degree in chemistry. The “Learn to Code” movement caught my eye and I started to believe that coding was the future.

Phrases like: "Everyone should learn how to code", "Code to become the next Bill Gates", gave me the impression that coding was a necessary skill everyone needed to know to succeed in the future, or else they would fail. I even wrote about "coding being inevitable" for everyone in my statement when I applied to UWaterloo (looking back, that was super cringe).  

I tossed my dream of pursuing chemistry away and decided to get a degree in computer science. 

# Why is learning to code such a hot topic? 
Okay, but so a lot more young people are learning how to code, and the movement is only growing in strength. I wondered why and came up with these points:

## Accessibility
In developed nations, over [80% of households](https://www.statista.com/statistics/1107826/access-to-computer-in-households-worldwide/) have a personal computer. This makes coding very accessible, a vast improvement from the early ages of computers, where a computer filled a giant room and you had to line up and wait in order to run your code. This is unlike the other sciences. If you want to try out a chemistry experiment you read up on, good luck. Unless your high school or local university has a good supply of chemicals and proper equipment and permits you, there’s a very slim chance of trying out that chemical experiment. There are also more consequences if you screw up a chemical reaction, much less so if you forget a semicolon. Additionally, the learning curve for HTML is much lower than say physics or chemistry, which requires a good amount of study before you can run your own experiments. 

## Instant gratification and Tech solutionism
Coding delivers instant gratification, due to its accessibility and a concept called tech solutionism. It takes seconds to pull up an online REPL and execute code right in your browser. You don’t even need to understand the code to have something show up. This makes it seem like coding is easy, which it really isn’t. 

Coding can also feel like a shortcut to solving many problems since there’s a growing “belief that every problem has a solution based on technology”. Hackathons are such events that encourage this type of thinking, using challenge prompts like “Best hack that solves a climate problem”, leading hackers to feel lots of instant gratification in designing an application that they think is helpful, when it’s actually downright useless or even harmful. There is also an over-emphasis on the technology being used, with all the time and energy being poured into choosing which AI model to use or whether to use the blockchain or a regular database and shifting focus away from the actual problem. Tech takes many human problems, turning them into tech problems instead. An excellent talk on this idea is [here](https://t.co/RM2hBKW4tw). 

Many human problems are complex problems with a deep history. [Turning a human problem into a technical problem may seem like you're solving the human problem, but you may end up "misunderstanding a human problem, introducing a new problem, which shifts the focus and gatekeeps"](https://youtu.be/B1v2KIdL5Rs?t=2220) and causes harm. [An example is a website built by two Harvard students that tried to house refugees from Ukraine](https://gizmodo.com/harvard-students-refugee-housing-website-ukraine-take-s-1848708164). When seemed like a good product was full of security holes and bugs ready for exploitation. For instance, 

> lax security measures have also exposed the private data of the hosts opening their homes to refugees, allowing anyone to see information including hosts’ phone numbers and email addresses with a few clicks.

Media also worsened the situation by praising this hacked together website, shifting focus away from those doing the ground work. Not only was the product a privacy and security nightmare, but it showed how clueless it's creators were about relocating refugees. 

> In an interview with Gizmodo, Chojecka also said she had a problem with the site’s lack of education about the refugee experience for hosts, the fact that it did not translate listings into multiple languages, and that it had listings from places as far away as the U.S.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Thank you for your unexpected attention to my latest post about <a href="https://twitter.com/AviSchiffmann?ref_src=twsrc%5Etfw">@AviSchiffmann</a> and his (in our opinion) website UkraineTakeShelter which we consider unethical and harmful to refugees that we are currently dealing with (over 1 mn traumatized people entering the country).</p>&mdash; Kasia Chojecka (@chojecka_kasia) <a href="https://twitter.com/chojecka_kasia/status/1501475743687233536?ref_src=twsrc%5Etfw">March 9, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

You would never say other skills like wielding, cooking, or pipetting could solve all the world’s problems. Why is coding any different from other skills? 

Coding (and technology) has limitations, and many times coding can introduce problems you would never have with traditional or alternative methods. You can read about my thoughts on tech solutionism in hackathons [here](@/blog/compsci/hackathons.md#what-are-we-trying-to-solve-here). 

## Marketing 
There’s no marketing initiative as strong as “Learn to Code”. No one is marketing “Learn History” or “Learn Chemistry” because a bunch of people who know history or chemistry don't serve giant companies well. By giant companies, I mean tech companies. It’s cheap for a tech company to produce a MOOC and sell it to people desperate for a better-paying job. These people with only coding skills are then at the will of large companies to pick and choose who they want. And with only more and more people wanting a job in tech, companies can be less competitive with salaries.

While “Learn to Code” isn’t as common now, there are other marketing campaigns and initiatives telling us to quickly learn about AI to get a job in AI or quickly learn about Web3 and get a job in Web3 because iTs tHe fuTUrE. You rarely ever see this in other areas such as chemistry, with organic chemistry being cool one year, and materials chemistry being hot another year. [Fast Food Education](https://www.kernelmag.io/pieces/fast-food-education) discusses the rise of coding/design boot camps and their shallow and lacking curriculums, which flood the market with a bunch of people with the same skills.

# Is teaching everyone to code the right thing to do? 
I think we should all be learning about how a computer works. To many, computers are “magical intelligent pieces of metal”. Yet computers are impacting every single part of our lives, and many people do not understand how a [file system](@/blog/compsci/computers.md#a-misunderstanding-lack-of-understanding-of-a-file-system) works or how a [computers reads and writes from memory](@/blog/compsci/computers.md#how-memory-works-in-progress).

Before you learned about physics, chemistry, math, and biology you might have thought other events were magical, like how baking powder works, how that weird Möbius paper is a single-sided strip with one edge, and how sound travels. But through our education, we have all gained some understanding of how these magical events work; baking powder mixed with water produces carbon dioxide bubbles (making your muffins fluffy), the math behind the one-sided paper, and that sound travels in waves. Does learning to code accomplish one’s desire to understand how a computer works? 

{{ blogImg(img="Mobius.jpg") }}

No, not always. Coding in high-level languages like Python, JavaScript, or scripting languages like HTML or CSS does not. This high-level coding is what is mostly taught by boot camps and current elementary and secondary computer science curriculums. Coding in Python simply lets us tell a computer what we want it to do (thanks to computer scientists who abstracted away a lot of details, it’s easy for anyone to write an easy program now). When you save a text file to your computer do you know how it’s saved on your computer? Coding in Python doesn’t tell you much if anything about how the computer saves your file. Before I studied computer science, I had no idea how computers did anything! How does the computer save files and then find them later, what is an operating system and what does it manage and control, how does the computer manipulate incoming information, and much more? Learning to code from boot camps or online MOOCs tells you nothing about this. So if you're interested in coding, [check out why computers are actually cool, and I hope you instead learn about computers](@/blog/compsci/computers.md)!

# End
Teaching only code is like only teaching someone lab skills. Of course, someone will eventually discover which two reactants will produce the desired product by trial and error, but they will have a lacking understanding of why a chemical reaction works. As the saying goes; “Give a Man a Fish, and You Feed Him for a Day. Teach a Man To Fish, and You Feed Him for a Lifetime”.

Because let’s face it; what goes up must always come down. Teaching skills today does not always mean these skills will be useful in the future. Tech has gone through many big booms; first C, Java, JavaScript, AI, and now Web3. Who knows what is next? But something that will stick with us for a long time is the [computer](@/blog/compsci/computers.md). 

References and inspiration:
- [Fast Food Education](https://www.kernelmag.io/pieces/fast-food-education)
- [My thoughts on hackathons](https://lhao03.github.io/blog/hackathons/)

*Updates: typos and making metaphors with chemistry less confusing and fixing weird grammars.*
