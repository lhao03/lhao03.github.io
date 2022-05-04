+++
title = "Papers and Books"
sort_by = "date"
template = "subsection.html"
page_template = "post.html"
+++

I'm currently reading a bunch of papers and books to see what I'm interested in and I wanted a way to rank each paper. I'm going to use two criteria, understanding and interest. 

{{ expand(title="Interest",
content="
1. I'm falling asleep.
2. Reading through the paper is a like a task and I'd rather read another paper.
3. 
4. 
5. The paper is neutral. I don't mind reading it, but I don't think I'd miss reading it.
6. 
7. 
8. 
9. 
10. I feel excited reading this and would love researching more about this topic."
) }}

{{ expand(title="Understanding",
content="
1. I don't understand a single sentence.
2. I know less than half of the key words and have a very limited (non existent) understanding of the paper.
3. I know most key words but I can't really understand the main idea of the paper.
4. I know most words and understand the idea but get lost still.
5. I know most key words and have a general idea of the topic of the paper but couldn't explain much about the paper to anyone.
6. I can get a good idea about the topic of the paper, but can't really form any questions or my own thoughts on the paper and I have trouble talking about the paper to someone else and have to refer back. 
7. I can understand the paper and overarching ideas and details well, and have some of my own thoughts on the paper, but those thoughts may be half baked. I can get a general idea of the paper across to someone without needing to refer back the paper.
8. I've come across the same problem/topic in the paper, and understand the ideas and solutions presented, and could talk about them with someone else.
9. I've also thought about the same ideas and come across the same research problem. I can lightly debate about the paper with someone else and can think of questions to ask the authors.
10. I could of written this myself (well not really)! I could probably present the paper to someone else clearly and have a conversation with the authors."
) }}

Currently, my understanding of topics is (most understanding to least) virology, biochemistry/chemical biology, computer science, chemistry.

As for my interests ranking of topics, I'm not sure yet. 

{{ expand(title="Papers",
content="
# Read
- CARAT CAKE: replacing paging via compiler/kernel cooperation
- Quantifying SARS-CoV-2 transmission suggests epidemic control with digital contact tracing 
- Dangers of a fixed mindset: implications of self-theories research for computer science education
- The End of Computing Science?
- Guiding Target Synthesis with Statistical Modeling Tools: A Case Study in Organocatalysis
- NonVolatile Memory for Fast Reliable File Systems
- Photodynamic and Contact Killing Polymeric Fabric Coating for Bacteria and SARS-CoV‑2
- ProSE: the architecture and design of a protein discovery engine
- SARS-CoV-2 Evolution: On the Sudden Appearance of the Omicron Variant
- Teaching CS unplugged in the high school (with limited success)
- To Code or Not to Code, That Is the Question
- From Principles to Practice with Class in the First Year
- Understanding and exploiting optimal function inlining
- Geek genes, prior knowledge, stumbling points and learning edge momentum: parts of the one elephant?
- Understanding Sources of Student Struggle in Early Computer Science Courses
- Why Computer Science Doesn't Matter
- Folk Pedagogy and the Geek Gene: Geekiness Quotient
- Developing Behavioral Concepts of Higher-Order Functions

# To Read
## AI
- Artificial intelligence in Medicine.pdf
- Capable but Amoral? Comparing AI and Human Expert Collaboration in Ethical Decision Making.pdf
- Holding artificial intelligence to account.pdf
- ‘It Is Not Always Discovery Time’: Four Pragmatic Approaches in Designing AI Systems.pdf
- On the Dangers of Stochastic Parrots: Can Language Models Be Too Big?.pdf
- Problems and Opportunities in Training Deep Learning Software Systems: An Analysis of Variance.pdf
- The medical algorithmic audit.pdf

## Chemical Biology, Biochemistry, Microbiology
- A Bacterial Cell Shape-Determining Inhibitor.pdf
- An engineered live biotherapeutic for the prevention of antibiotic-induced dysbiosis.pdf
- Biology's response to dieting_ the impetus for weight regain - PMC.pdf
- ChemBioChem - 2021 - Paul - Selection of M2 ‐Independent RNA‐Cleaving DNAzymes with Side‐Chains Mimicking Arginine and.pdf
- Computation of the Protein Conformational Transition Pathway on Ligand Binding by Linear Response-Driven Molecular Dynamics.pdf
- Learned protein embeddings for machine learning.pdf
- Membrane Protein Amphipathic Helix Structure Prediction Using Deep Neural Networks.pdf
- Protein sequence design with deep generative models.pdf

## Chemistry
- 'A predictive and mechanistic statistical modelling workflow for improving decision making in organic synthesis and catalysis.pdf'
- 'A self-cleaving DNA enzyme modified with amines,'$'\n''guanidines and imidazoles operates independently'$'\n''of divalent metal cations'
- 'Bridging the Gap between Proteins and Nucleic Acids: A.pdf'
- 'ChemBioChem - 2001 - Chen - Artificial Nucleases.pdf'
- 'Deep reinforcement learning for de novo drug design.pdf'
- 'Emergence of Self-Reproducing'$'\n''Metabolisms as Recursive'$'\n''Algorithms in an Artificial'$'\n''Chemistry.pdf'
- 'Molecular electronics sensors on a scalable'$'\n''semiconductor chip: A platform for single-molecule'$'\n''measurement of binding kinetics and enzyme activity.pdf'
- 'Prototype Smartphone-Based Device for Flow Cytometry with.pdf'
- 'Save America’s Patent System.pdf'
- 'Toward an RNaseA Mimic: A DNAzyme with Imidazoles and Cationic Amines.pdf'
- 'Towards reproducible computational drug'$'\n''discovery.pdf'
- 'Transferrable Selectivity Profiles Enable Prediction in Synergistic Catalyst Space.pdf'

## Commentaries
- In Defense of Boring.pdf
- Of Boilers, Bit, and Bots.pdf
- SteepCostCapture.pdf
- storiesofpossiblityes.pdf
- Systems Software.pdf
- The Great and Terrible Oz.pdf
- The Human and Ethical
- Aspects of Big Data.pdf
- The_Human_Experience.pdf
- The Incredible
- Lightness of Software.pdf
- Woven_on_the_Loom_of_Sorrow.pdf

## CS Education
- 'ACL2 for Freshmen: First Experiences.pdf'
- 'A Functional IO System.pdf'
- 'A Theory of Robust API Knowledge.pdf'
- Detecting and understanding students' misconceptions related to algorithms and data structures.pdf
- 'Developing Behavioral Concepts of Higher-Order Functions.pdf'
- 'Dimensions of Experientialism for.pdf'
- 'Early Post-Secondary Student Performance.pdf'
- 'Functional Programming and Theorem Proving for Undergraduates: A Progress Report.pdf'
- 'Nudging Student Learning Strategies Using Formative.pdf'
- 'Teaching Explicit Programming Strategies to Adolescents.pdf'
- 'The DrScheme Pro ject: An Overview.pdf'
- 'The Structure and Interpretation of the'$'\n''Computer Science Curriculum'
- 'The Structure and Interpretation of the Computer Science Curriculum .pdf'
- 'The Structure and Interpretation of the Computer Science Curriculum.pdf'
- 'The TeachScheme! Project.pdf'
- 'Trauma-Informed Computing: Towards Safer Technology Experiences for All.pdf'
- “It Must Include Rules”: Middle School Students’.pdf


## HCI
- An Exploratory Study of Sharing Strategic Programming Knowledge.pdf
- Fairness and Abstraction in Sociotechnical Systems.pdf
- Feeling Proud, Feeling Embarrassed: Experiences of Low-income Women with Crowd Work.pdf
- Learning to Listen for Design.pdf
- “Look! It’s a Computer Program! It’s an Algorithm! It’s AI!”: Does Terminology Affect Human Perceptions and Evaluations of Algorithmic Decision-Making Systems?.pdf
- Pandemic Displays: Considering Hygiene on Public Touchscreens in the Post-Pandemic Era.pdf
- Rethinking Menstrual Trackers Towards Period-Positive Ecologies.pdf
- Still Creepy After All These Years:The Normalization of Affective Discomfort in App Use.pdf
- street-level_algorithms.pdf
- Understanding How eHealth Coaches Tailor Support For Weight Loss.pdf
- Understanding the impact of explanations on advice-taking: a user study for AI-based clinical Decision Support Systems.pdf
- Using Design Alternatives to Learn About Data Organizations.pdf
- utopia.pdf
- Actionable Auditing: Investigating the Impact of Publicly Naming Biased Performance Results of Commercial AI Products.pdf

## Health
- A State-Based Medication Routine Framework.pdf
- Understanding the Role of Polyfunctional Immune Cells in Cancer and Other Diseases.pdf

## Programming Languages
- 'A Programmable Programming Language.pdf'
- 'Bounded Abstract Effects.pdf'
- 'Bounded Verification of Multi-threaded Programs via Lazy Sequentialization.pdf'
- 'Comparing Block-based Programming Models.pdf'
- 'Compiler Error Messages Considered Unhelpful: The Landscape of Text-Based Programming Error Message Research.pdf'
- 'Completeness and Complexity of Reasoning about Call-by-Value in Hoare Logic.pdf'
- 'Conditional Independence by Typing.pdf'
- 'From Macros to DSLs: The Evolution of Racket.pdf'
- 'Gradual Typing as if Types Mattered.pdf'
- 'How Statically-Typed Functional Programmers Write Code.pdf'
- 'Programming Languages as Operating Systems (or Revenge of the Son of the Lisp Machine)'
- 'Safe-by-default Concurrency for Modern Programming Languages.pdf'
- 'Transferring Skills at Solving Word Problems from Computing to Algebra Through Bootstrap.pdf'
- 'Type Inference for C: Applications to the Static Analysis of Incomplete Programs.pdf'


## Proof Verification
- Investigating Safety of a Radiotherapy Machine Using System Models with Pluggable Checkers.pdf
- RustHorn: CHC-based Verification for Rust Programs.pdf
- Therac25-Leveson.pdf
- The_Therac-25_30_Years_Later.pdf
- Validation and algorithmic audit of a deep learning system for the detection of proximal femoral fractures in patients in the emergency department: a diagnostic accuracy study.pdf

## Software Engineering
- Are Mutants a Valid Substitute.pdf
- Understanding How Programmers Can Use Annotations on Documentation.pdf

## Systems
- An-Implementation-of-a-LogStructured-File-System-for-UNIX.pdf
- Assuage: Assembly Synthesis Using A Guided Exploration.pdf
- Sayer: Using Implicit Feedback to Optimize System Policies.pdf
- NVAlloc: rethinking heap metadata management in persistent memory allocators.pdf
- Every walk’s a hit: making page walks single-access cache hits.pdf
- FlexOS: towards flexible OS isolation.pdf
- Adelie: continuous address space layout re-randomization for Linux drivers.pdf
- Finding missed optimizations through the lens of dead code elimination.pdf
- Efficiently detecting concurrency bugs in persistent memory programs.pdf
- CHERI JNI: Sinking the Java security model into the C.pdf
- The-Measured-Performance-of-Personal-Computer-Operating-Systems.pdf

## Virology
- An oral SARS-CoV-2 M pro inhibitor clinical candidate for the treatment of COVID-19.pdf
- Distinctive Roles of Furin and TMPRSS2 in SARS-CoV-2 Infectivity.pdf
- Inactivated SARS-CoV-2 Vaccine Shows Cross-Protection against Bat SARS-Related Coronaviruses in Human ACE2 Transgenic Mice.pdf
- Structural Basis for Human Receptor Recognition by SARS-CoV-2 Omicron Variant BA.1.pdf
- The COVID-19 Humoral Immunological Status Induced by CoronaVac and AstraZeneca Vaccines Significantly Benefits from a Booster Shot with the Pfizer Vaccine.pdf
- When Poly(A) Binding Proteins Meet Viral Infections, Including SARS-CoV-2.pdf"
)}}

Below you can read my sporadic and simple thoughts on papers and books by great people!




