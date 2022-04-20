+++
title = "Digital contact tracing has left the science behind."
date = 2022-04-18
draft = false
updated = 2022-04-20
+++

*I welcome thoughts and critique on this post. Contact me via Twitter or email.*

There's a lot of misconceptions about viruses floating around, and it's hard to dig through all that information. And with the arrival of COVID-19, it seems that everyone's become a virology expert, and yet they haven't. Am I a virology expert? Defiantly not, but I've taken courses in microbiology, virology, chemistry, biochemistry and biology. I also read research papers on viruses and articles written by experts. These are just my thoughts. 

Many "solutions" around preventing or tracking COVID-19 ignore the chemistry, physics and biology of viruses, creating the idea that getting infected is like going into a ball pit and trying to avoid being hit by a "positive" ball. Technical solutions, like digital contract tracing apps reduces COVID-19 transmission into the idea that we only need to be near sick people to get sick.

Think about this. With surface spreading viruses or fluid (liquid) spreading viruses, we don't need to be near someone to get sick. People can get infected with cholera by using water from a stream that could by miles away from the infected person. We need to be in contact with that surface or fluid to get sick. It doesn't matter if that person is close or not, though that person being close can increase the risk of us getting sick, it's not the main determining factor. [In fact, there are several cases of COVID-19 transmission between people who have never seen each other, but have breathed the same air via air conditioning](https://wwwnc.cdc.gov/eid/article/26/7/20-0764_article).

As [Ali Alkhatib](https://ali-alkhatib.com/blog/digital-contact-tracing) says in his blog post "We Need to Talk About Digital Contact Tracing", 

> Digital contact tracing systems that render the world as normally distributed space with spheres of influence and contact characterized by radio waves will consistently leave us with dangerously wrong pictures of our exposure.

I'll be discussing the forgotten science of viruses, but please check out his blog post to learn how digital contact tracing excludes the most vulnerable, gathers unrepresentative data, how proximal tracing doesn't maintain privacy and how proximity is a dangerously simple way to model and think about COVID-19 transmission. 

# To get infected, viruses require affinity and avidity with the human receptor.
There's a lot of chemistry, physics and biology involved in getting infected. First, the physics of viruses. Viruses spread through surface, liquid and air. The physics for each medium is different and it's important we all have some basic understanding of how to prevent transmission given the medium of spread. If transmission occurs by:

- surface: sanitize, wash your hands and don't shake hands.
- liquids: boil drinking water, don't drink suspicious liquids be vary of who you share fluids with.
- air: filter the air and wear a N95 mask when air filtration isn't possible or when you must interact with people.

But preventing transmission isn't always possible. To become infected, viruses require affinity and avidity. What does this mean? Well it's time for chemistry. Affinity is how strongly two molecules will react with each other. We can think of this as the binding event between the virus and human receptor. The stronger the binding event, the better. More specifically if the virus has more affinity to bind than the native molecule that usually binds to the human receptor, then the virus is on it's first step to infecting us. Next, we must have avidity, which is [the accumulated strength of multiple affinities](https://en.wikipedia.org/wiki/Avidity). Affinity isn't always enough, thus, if there's more virus than native molecule, the higher concentration of virus can out compete the human molecule. Once some threshold is met, you are infected. 

{{ blogImg(img="binding.png") }}
[Figure is from this paper](https://pubmed.ncbi.nlm.nih.gov/33502950/)

And the biology is how our body responds. Our immune systems will respond first, however infection can involve other organs, such as our lungs.

Okay, so what does this mean? There are some things we can't control, like how a virus spreads or which human receptor the virus will bind to and how strongly that virus will bind. But there are some things we can control, like avidity and our immune response. We can control our avidity to a virus by wearing high quality masks and requesting better air filtration. We can control our immune response by getting vaccines.

Unfortunately, education on proper masks has been non existent, with some health leaders suggesting that cloth masks are still okay to wear ([they aren't](https://www.cidrap.umn.edu/news-perspective/2021/10/commentary-what-can-masks-do-part-1-science-behind-covid-19-protection)). 
{{ blogImg(img="mask.jpg") }}

Contact tracing apps make it easy to forget the physics, chemistry and biology of viruses. These apps boil viruses down to exposure time and proximity to infected individuals. Many important factors like the method of spread, avidity and immune response are pushed to the sidelines with software solutions.

# Viruses mutate at random. A lot.
But viruses don't mutate everywhere at random. We've observed with COVID-19 variants and other coronaviruses that there are some conserved regions that undergo mutation a lot less. For instance, the [residues of the substrate-binding pocket of the substrate-binding pocket are highly conserved](https://portlandpress.com/bioscirep/article/40/6/BSR20201256/224927/Glecaprevir-and-Maraviroc-are-high-affinity) and don't really undergo much mutation, since this protein is essential to replication and proteolytic processing.

But the spike protein on the other hand goes through a lot of mutation. For instance, [many Omicron's mutations](https://covariants.org/variants/21K.Omicron) are associated with the ACE2 receptor binding and antibody binding sites (our vaccines currently target these proteins). 

Mutations are random, but those random mutations that can survive current drugs and vaccines are the viruses that will continue to spread. Mutations that occur on proteins like the main protease may also occur, but some mutations are more deadly to the virus than others, and these mutated viruses simply cease to replicate, ending their ability to spread.

With that being said, for current drugs and vaccines to continue working, we have to slow down the chance for the virus mutate. The likelihood of mutation increases as more and more people become infected. This means we must prevent infection. 

People will argue that infection is mild, but getting infected isn't just about getting infected. It's about whether or not you become the new reservoir to the next COVID-19 variant.

How a digital contact tracing app could help prevent new variants could be by preventing infection. Preventing infection means letting people know if they have been sick, and gathering information on infected people. Unfortunately, in Western nations, it seems that government has given up on this. 

## Lack of maintainability and unclear goal of the digital contact tracing app. 
The Canadian government came out with a report, [Interim report on social and economic determinants of app adoption, retention and use](https://www.ic.gc.ca/eic/site/icgc.nsf/eng/07716.html), reviewing how the app has done during the pandemic. Here are my thoughts (in italic). When I say "council" I mean "COVID-19 Exposure Notification App Advisory Council".

> COVID Alert has been downloaded over 6 million times, and 20,000 people have since entered a one-time key (OTK) following a positive COVID-19 test result, notifying other users that they may have been exposed to the virus.

*As of Feb 2022, there have been 6,893,423 downloads and 57,704 keys used. With a population of around 38 millions, this means only 15-20% of the population has downloaded the app. There are apparently 3.64M tracked COVID-19 cases in Canada when I checked on Apr 18. This means the app had access to around 1.6% of positive cases to determine if someone could have been exposed, and then alert them. Such a low number of reported cases means this app is a inaccurate tool for someone to use as a judgement to whether they have been exposed or not.*

> COVID Alert is a national exposure notification app that will alert users if they have been in close contact with other users who have tested positive for COVID-19.

*Getting only reports for "close contact" gives the impression that you can only get sick from being "close" to someone. This is incorrect, since researchers have discovered cases in which no one was a close contact with each other, yet still people were becoming infected. You **can** get sick **without** being near someone who is sick.*

> Although individuals experiencing these barriers  are unable to use the app directly, they can still benefit from it if other people use it. For example, if someone with the app receives a notification, they may decide not to visit a medically vulnerable person. This action protects the vulnerable person from potential exposure, even if the vulnerable person does not have their own compatible phone.

*Much of the app is based on voluntary action. "may decide" is used, and this makes it seem as if vulnerable people are at the mercy of those who have the latest technology and can use the digital contact tracing app. We can't assume people will act with the best intentions, and certainly cannot just leave vulnerable folks at the hands of able bodied and privileged people. The report also implies that it's okay to exclude vulnerable from this tool. Everyone deserves access to data and information to protect themselves.*

> Currently, British Columbia, Alberta, Nunavut and the Yukon have not adopted the COVID Alert app.

*If nearly all of Western Canada isn't able to use the app, then that's a huge piece of data missing.*
 
> Early notification is key to the success of the COVID Alert app in breaking the chain of infection by encouraging self-isolation until direction from public heath authorities can be sought. ... To date, more than 80% of users who receive an OTK enter it into the app; however, fewer than 5% of positive cases have obtained an OTK from their public health authority. 

*Again, lets assume those who get an key self isolate. That's less than 5% of positive cases self isolating. Public health requires the entire public to participate. 5% participating is simply too low.* 

The report outlines reasons that users uninstall the app: 

- Perceives that the app is not user-friendly;
- Believes that the app will not be substantially effective without broader public uptake;
  - *I believe this as well, and this statement is why I uninstalled the app. Digital contact tracing can provide some insight if most of the population uses it, much like in China, South Korea or Taiwan. With less than 5% of positive cases entering a key and only 18% of the population having downloaded the app (not sure how many actually use it), the data is just random noise.*
- Does not receive any exposure notifications and therefore assumes that the app is not performing as designed;
  - *Obviously this is because there's literally such low numbers of data being collected, which gives people the impression that COVID-19 isn't transmitting around that munch, which is totally incorrect. The app simply can't reflect the true transmission rates because not enough data is being entered.*
- Lacks understanding or is confused by on how the app works (e.g., contact-based and not location-based);
- Experiences anxiety related to receiving a notification and possible consequences (e.g., isolating, testing); or
  - *if you were to receive a diagnosis, you would probably prefer a human tell you, rather than an app. With an app, there's no one to help you answer follow up questions or to calm you down. This is why we need humans.*
- Experiences technical issues such as battery life on some phone models.
  - *bluetooth is incredibly battery draining.*

Here are some new features they've added:

- narrowing the exposure notification window to periods when a COVID-positive user was the most infectious, by allowing the user to voluntarily enter their symptom onset or test date;
  - *this is horrible. There are cases when people who are asymptomatic are infectious. Additionally, with all the COVID-19 variants, someone becomes infectious at different rates. We can't simplify down COVID-19 to just when we think someone is most infectious.*
- allowing users, specifically for health care workers, to manually turn the app off when wearing the appropriate personal protective equipment in areas with high likelihood of being near COVID-positive persons (e.g. test centres, long-term care facilities); and
  - *this makes some sense, but further research would need to be done.*
- allowing users to clear the exposed state following a negative test result, in order to permit users to receive new exposure notifications.
  - *guidance must be given on this. Since rapid tests aren't always accurate, someone may take a false negative as being no longer infected, when in fact they are still contagious.*

*These points oversimplify COVID-19 to just "avoiding" someone when they are most infectious, and encouraging people to prematurely return back to society when they may still be infectious. Transmission can occur when you're not even beside an infected individual. The virus can linger in the air. Nothing about letting users know about CO2 levels or air transmission is mentioned.*

Under "Strategies to reduce barriers and increase adoption, retention and proper use of the app":
> Establish a baseline number of app downloads that would be considered sufficient to appropriately measure the effectiveness of the app in reducing the spread of the virus;

*The council acknowledges that WHO said in 2020 that "no established methods for assessing the effectiveness of digital proximity tracking" but then goes on to say that "The Scientific Director of the Big Data Institute at the University of Oxford recently indicated that apps such as COVID Alert are having a positive impact, even in the absence of specific quantifying metrics and that the concept of a minimal adoption rate is less relevant to these apps because this type of tool is effective regardless of its level of up-take". I find this hard to believe.*

> The Government of Canada has begun to broadly consider how the COVID Alert app could potentially extend beyond a government service to Canadians and the public health system towards a tool that will also support Canadians and businesses in our economic, social and mental health recovery and restoration. To this end, it will be critical for individuals and businesses in Canada to have trust in the app's ability to support their safe return to worksites and universities, their reopening of businesses, and their use of modes of transportation including public transit (air, marine, and rail services) until the pandemic is declared over. The advice of the Council will help to inform the Government's next steps in all of these regards.

*The statement above directly contradicts with the statement that the Canadian government will work on "eventual wind-down of the app, including recommendations for the timely destruction of data."*

> Position COVID Alert as one additional tool at the disposal of Canadians, to better situate its position within the broader public health response to the COVID-19 pandemic and to highlight success stories that would resonate with Canadians; ... This will be critical in achieving wider uptake, which will involve clear communications, ongoing engagement with diverse partners and communities; and continuous improvements to the app (e.g. new functionalities and emerging technologies that could help to re-open parts of the economy)

*This frustrates me. We **have** tools that work and we **know** what works. Good quality masks, accurately tracking positive cases, waste water tracking, CO2 monitoring, air circulation and filtration, and PCR tests. I'm disappointed that none of these were mentioned. We don't need more tools, (and most certainly we don't need more apps). Instead, we need to use tools that work.*

> Through the deployment of the COVID Alert app, the Government of Canada has committed to deploying a technology-based solution that will assist Canada in flattening the curve and limiting the spread of COVID-19. 

*Public health isn't an area where technology-based solutions will prevent infection and emerging variants. Yes, technology can help, but technology as the main focus won't work. The public has to trust virologists and actively prevent infection by masking up, getting routinely tested for COVID-19 and allowing data like waste water to be tracked. We shouldn't be investing so much time and energy into a tool we aren't even sure works when we have tools that do work.*

*Technology based solutions frequently simplify complex solutions to create software that in the best case does nothing beneficial for society. It's been two years since the pandemic began and we have more knowledge of the virus. There are tools that do work, such as CO2 monitors, which can help someone decide if eating at a restaurant is safe or not. Digital contact tracing, at it's current state, does not provide any useful information to citizens. There are no metrics mentioned, after more than one year of use, if this app prevented anyone from being infected. We can't say the app has assisted at all in limiting spread of COVID-19 if there's no metrics to back that up.*

The thread below gives a another perspective of the app and how there's been a lack of maintainability.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">part of “responsible innovation/experimentation” and trust is how you end the thing. this idea was 1. bad on policy at the front, 2. lauded/paraded for technical execution (not efficacy) by the govt + others 3. now it just sits there.</p>&mdash; Bianca Wylie (@biancawylie) <a href="https://twitter.com/biancawylie/status/1515093743149404168?ref_src=twsrc%5Etfw">April 15, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

With more variants emerging, the government has a responsibility to update it's citizens about these variants and provide data to help citizens make informed decisions.

Our world is constantly changing, and software must adapt to these changes, not the other way around. However, it seems today that the world is constantly catering to the software, simplifying down complex situations only to have the world slap us in the face later.

# We get sick by interacting with the virus via surface, liquid or air, not just by being near an infected person. Viruses may be more airborne than we thought
In virology lecture we are taught that airborne particles can be respiratory droplets or aerosolised particles. Respiratory droplets eventually fall to the ground, while aerosolized particles can linger in the air. 

At the beginning of the pandemic, WHO made the erroneous judgement that COVID-19 was spread through respiratory droplets that eventually fall onto surfaces and then infect those that touch those surfaces. This mistake led Western nations to [slap a sanitizer machine at every building entrance, increase their sanitization of desks and more surface focused cleaning](https://www.nature.com/articles/d41586-021-00251-4). On the contrary, [many Asian countries have ignored WHO](https://twitter.com/JayCityExplore/status/1476868848393535498), acting on research that is paints COVID-19 as a much more infectious virus than WHO and Western nations think. And it seems to have paid off. 

[But can you blame WHO for this faulty judgement](https://www.nature.com/articles/d41586-022-00925-7)? [Well, it depends, because lot's of medical experts were making the assumption that most viruses couldn't be airborne since they were smaller than 5 microns.](https://www.wired.com/story/the-teeny-tiny-scientific-screwup-that-helped-covid-kill/). My virology lecture may have not be totally correct as well, because maybe respiratory droplets do stay in the air longer than we thought. 

There's a [history](https://www.wired.com/story/the-teeny-tiny-scientific-screwup-that-helped-covid-kill/) to the mistake WHO made. 

> In 1934, Wells and his wife, Mildred Weeks Wells, a physician, analyzed air samples and plotted a curve showing how the opposing forces of gravity and evaporation acted on respiratory particles. The couple’s calculations made it possible to predict the time it would take a particle of a given size to travel from someone’s mouth to the ground. According to them, particles bigger than 100 microns sank within seconds. Smaller particles stayed in the air. Randall paused at the curve they’d drawn. To her, it seemed to foreshadow the idea of a droplet-aerosol dichotomy, but one that should have pivoted around 100 microns, not 5. 

So what happened? Why haven't we been using the 100 micron metric? Well, 

> Part of medical rhetoric is understanding why certain ideas take hold and others don’t. So as spring turned to summer, Randall started to investigate how Wells’ contemporaries perceived him. That’s how she found the writings of Alexander Langmuir, the influential chief epidemiologist of the newly established CDC. Like his peers, Langmuir had been brought up in the Gospel of Personal Cleanliness, an obsession that made handwashing the bedrock of US public health policy. He seemed to view Wells’ ideas about airborne transmission as retrograde, seeing in them a slide back toward an ancient, irrational terror of bad air—the “miasma theory” that had prevailed for centuries. Langmuir dismissed them as little more than “interesting theoretical points.”

And then after Langmuir disparaged Well's work he came up with this:

> In the report, Langmuir cited a few studies from the 1940s looking at the health hazards of working in mines and factories, which showed the mucus of the nose and throat to be exceptionally good at filtering out particles bigger than 5 microns. The smaller ones, however, could slip deep into the lungs and cause irreversible damage. If someone wanted to turn a rare and nasty pathogen into a potent agent of mass infection, Langmuir wrote, the thing to do would be to formulate it into a liquid that could be aerosolized into particles smaller than 5 microns, small enough to bypass the body’s main defenses. Curious indeed. Randall made a note.

Langmuir did eventually shift his tone and accept that airborne infection was possible. After Well's died, Langmuir delivered a speech stating "problematic particles—the ones they had to worry about—were smaller than 5 microns." [And that screwup started it all](https://www.wired.com/story/the-teeny-tiny-scientific-screwup-that-helped-covid-kill/). However, particles that are up to 100 microns are also airborne!

While most viruses are 0.1 to 0.5 microns, viruses hitch a ride on the droplets that we produce when breathing, sneezing or coughing. From this [study](https://www.materials-talks.com/droplet-sizing-of-coughs-and-sneezes/) there are droplets that measure at below or around 100 microns. This means someone's sneeze can travel around a room. 

---

Okay, that was a lot of preamble. I wanted to set up why the virus being airborne is important and how digital contact tracing misses on this. Digital contact tracing apps seems like a fun algorithmic problem to determine who's been near who! Which is just another complex public health and social problem reduced into a algorithm. It seems perfect. In fact, I was exited for Canada to get their own contact tracing app after seeing some success in countries like South Korea and Taiwan. 

But the app is missing a lot of context. For one, depending on whether or no the air is actively being filtered, being 6 ft (or 2m) may be enough distance, or it might not be. The app simply doesn't know, and giving erroneous information is worse than no information. The app doesn't know anything about the quality of the air. Distance doesn't matter so much if the air is being constantly filtered. A CO2 monitor would be more helpful than an app that tells me if I've been near a sick person. Basically, the app totally simplifies and neglects how air transmission works. The only way you can tell if you've been exposed is if you have a CO2 monitor telling you if air is being filtered and circulated around enough such that you aren't breathing in the air other people exhale.

It would be useful to know if I was in a restaurant or building that had bad air quality. Much of the public has no access to knowledge of whether their air is being filtered or not, or the quality of the filter. If we aren't able to access high quality, real time data on positive cases, understanding our air quality is the next best piece of data we can use to make informed choices. 

# Conclusion
Digital contact tracing apps give the wrong idea that getting sick means you must be near someone sick. You get sick from inhaling air that has particles with the virus, and once you've hit a certain threshold, then you can become infected. All the money going into building digital contact tracing apps could of gone into providing high quality masks, CO2 monitors and better air filtration systems. [Alberta spent $4.3 million on their digital contact tracing app, which only notified 1,500 people of possible exposure.](https://www.cbc.ca/news/canada/edmonton/158-albertans-with-covid-19-reported-their-illness-to-province-s-multimillion-dollar-app-1.6202636). 

In addition to the points [Ali Alkhatib](https://ali-alkhatib.com/blog/digital-contact-tracing) gave, let's not keep crafting up expensive high technology tools that marginalise those who can't afford to use the technology. To repeat what I said above: We **have** tools that work and we **know** what works. Good quality masks, accurately tracking positive cases, waste water tracking, CO2 monitoring, air filtration and circulation and PCR tests. We don't need more tools. We need to use tools that work.
