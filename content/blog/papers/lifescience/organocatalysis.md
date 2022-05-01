+++
title = "Paper: Guiding Target Synthesis with Statistical Modeling Tools: A Case Study in Organocatalysis"
date = 2022-04-27
draft = false
[extra]
understanding = 4
interest = 7
+++

Guiding Target Synthesis with Statistical Modeling Tools: A Case Study in Organocatalysis
Isaiah O. Betinol, Yutao Kuang, and Jolene P. Reid
Organic Letters 2022 24 (7), 1429-1433
DOI: [10.1021/acs.orglett.1c04134](https://doi.org/10.1021/acs.orglett.1c04134)

- reactions with considerable synthetic effort with uncertain results are not likely to be explored.
- [organocatalyst](https://www.sciencedirect.com/topics/chemistry/organocatalyst): mimic enzyme catalysis that Mother Nature uses to control and regulate both biologically important reactions and synthesis of secondary metabolites.
  - enantioselective: use of chiral coordination complexes as catalysts
- use Statistical models to distinguish between different catalysts and reactions to guide selection of synthetic routes.

- reactions optimized on simple substrates often fail on similar, but more complex systems due to differences in reaction requirements.
  - there are limited amounts of high-value substrates
  - use of multivariate linear regression as a tool to change in any reaction component will alter the experimental outcome.

prediction tasks (taken directly from the paper)
- Despite the diverse structural features embedded in target molecules, is it possible to predict the enantioselectivity of key steps toward their synthesis?
- If so, can this be applied toward both complex scaffolds and single-molecule targets?
-  Finally, when different catalysts and reactions can be utilized to generate the same products, can statistical models allow the selection of the best synthetic route?

- three literature reactions that produced functionalized indole structures from enamine and in situ-generated iminiums

- goal: exrapolate to new reaction types that provide varying levels of enantioselectivity, catalyst was highly represented in training set but iminium and enamine was not.
  - hmm
- model highlights iminium, nucleophile and catalyst as important contributors to enantioselectivity, required steps for ee (enantiomeric excess) prediction are:
  - locate ground state of these reactions by DFT (density functional theory)
  - obtain relevent model descriptors shown
  - submit to mathematical equation

- model captures that 2-naphthyl-derived chiral phosphates will provide excellent levels of enantioselectivity even though training reactions emphasze importance of large catalyst groups for high ee.
  - model clearly explains why these substrates work well with less bulky catalysts
- most significant contrast between target reaction and similar reactions: both nucleophile and iminium have large steric profiles.
  - suggests matching a bulky nucleophile and iminium produces enhanced repulsive interactions with catalyst substituents in the TS leading to competing enantiomer.
    - high enantioselectivities can be obtained with smaller catalysts when they are paired with large reactants

  - expanded to transformations catalyzed by secondary amines.
    - model describes reaction between aldehydes and reactants that proceed via chiral iminium/enamine intermediates.
    - these reactions undergo formation of stereocenters implanted within common functional groups => these functional groups can undergo changes for product diversity => can model predict this step
    - because there is a lot of important structural motifs 

- model did well on amination reaction that was well represented
- challenged the model to predict enantioselectivity of alkenylation and Friedel-Crafts reactions
  - model correctly predicted an alkenylation reactions that combine copper and secondary amine catalyst
  - model can also effectively predict enantioselectivity outcome of Diels-Alder cyclization cascade even though this wasn't represented in training set.

- model predicted using secondary amine catalyst would result in higher ee compared with chiral phosphate catalyst (consistent with experiment)
  - model also suggests the choice is not critical since both catalysts show relatively high performance
    - other factors like cost or accessibility could lead in choosing a catalyst
