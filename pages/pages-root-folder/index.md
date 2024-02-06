---
#
# Use the widgets beneath and the content will be
# inserted automagically in the webpage. To make
# this work, you have to use › layout: frontpage
#
layout: research-index
header: no
permalink: /index.html
---
# Research Interests
To maintain robustness and control in adopting advanced black-box
neural technologies, such as foundation models, domain-specific
conversational systems can gain advantages from employing
interpretable modular designs. This involves breaking down tasks into
logically abstracted or theory-grounded sub-modules aligned with our
desired level of control. My research focues on addressing the challenges:
- **Modularized NLP.** To connect each module and make a coherent
          system, my research studies *deep structured prediction* for
          extracting symbolic representations from text
          ([Dissertation'22](https://www.proquest.com/docview/2777357718?pq-origsite=gscholar&fromopenview=true),
          [CoNLL'19](https://aclanthology.org/K19-2013/),
          [ACL'19](https://aclanthology.org/P19-1563/),
          [NAACL'21](https://aclanthology.org/2021.naacl-main.62/),
          [IWSDS'23](https://arxiv.org/abs/2302.12944)) and
          *controllable generation* with augmented-memory, symbolic or
          neural-symbolic constraints
          ([DSTC7'19](http://workshop.colips.org/dstc7/papers/13.pdf), [ACL'19](https://aclanthology.org/P19-1192/),
          [BEA'23](https://aclanthology.org/2023.bea-1.47/)).
- **Learning with Inductive Biases.** Beyond the expensive supervised data in many domains~(e.g.,
          psychotherapy, teaching, tutoring, small-group collaboration), we investigate learning with domain-specific knowledges as inductive biases, such as graph-based parsing via anchoring analysis([CoNLL'19](https://aclanthology.org/K19-2013)),
      database workload characterization via self-supervised learning([VLDB'22](https://dl.acm.org/doi/10.14778/3503585.3503600)),
      zero-shot dialogue state tracking via description-driven
      learning and supplementary pretraining([NAACL'21](https://aclanthology.org/2021.naacl-main.62/)).
- **Deployment in Real-world Scenarios.** Unexpected,
      complex dialogue scenarios can potentially span infinitely many
      topics, states and environmental settings([ACL'23](https://aclanthology.org/2023.acl-short.156)). We study
      robustness issues when deploying dialogue system in our daily
      life, such as in-classroom AI partner([AIAIC'23](https://aichildinteraction.github.io/preprint/AIAIC23_paper_7399.pdf)),
      noisy speech~([UMAP'23](https://dl.acm.org/doi/10.1145/3565472.3595606)),
      multi-party, multi-modal dynamics ([IWSDS'23](https://arxiv.org/abs/2302.12944)),
      and conversational simulation.


# News
- 11/2023: In Fall 2023, I taught NLP class~([CSCI-LING 5832](https://canvas.colorado.edu/courses/95371/)) with James Martin. I newly created course materials on LLMs, In-Context Learning, Dialogue Generation, etc.
- 05/2023: Our paper on Question Generation accepted to [BEA'23](https://sig-edu.org/bea/2023)
- 05/2023: A short paper on "Mind the Gap between the Application Track and the Real World" got accepted to [ACL'23](https://2023.aclweb.org/calls/main_conference/)
- 04/2023: Our paper on "A Comparative Analysis of Automatic Speech Recognition
Errors in Small Group Classroom Discourse" got accepted to
[UMAP'23](https://www.um.org/umap2023/).
- 03/2023: \#FirstGrant My research proposal on conversational simulation on small-group discussion got awarded by iSAT Trainee Grant.
- 02/2023: Our paper on AI agent for Jigsaw Classrooms got accepted on [AIAIC'23](https://aichildinteraction.github.io/).
- 12/2022: Our paper on Dependency Dialog Act got accepted on [IWSDS'23](https://sites.google.com/view/iwsds2023/home).
- 12/2022: Invited Talk on Database Workload Characterization work at Microsoft's Gray Systems Lab. [Slides](https://www.debjyotipaul.in/assets/pub/query_encoder_vldb22_slides.pdf).
- 08/2022: I joined [NSF AI Institute for Student-AI Teaming (iSAT)](https://www.colorado.edu/research/ai-institute/) as a post-doctoral researcher.
- 06/2022: New preprint on [visual analysis of neural network pruning](https://arxiv.org/abs/2206.07918?context=cs.LG).

# Selected Publications

{% bibliography %}
<!--
{% bibliography --query @*[year=2021] %}
{% bibliography --query @*[year=2019] %}
{% bibliography --query @*[year=2015] %}
{% bibliography --query @*[year=2012] %}
-->

# Research Experience
- [09/2022 - Now ] Postdoctoral Research Associate at [NSF AI Institute for Student-AI Teaming(iSAT)](https://www.colorado.edu/research/ai-institute/), CU Boulder.
- [08/2015 - 08/2022] Research Assistant at **Utah NLP Lab, Univeristy of Utah**, Salt Lake City
- [06/2020 - 12/2020] Applied Scientist Intern at **AWS AI, Amazon Lex**, Remote
   *  Our paper on schema-guided dialog got accepted by NAACL 2021.
- [06/2019 - 09/2019] Applied Scientist Intern at **AWS AI, Amazon Lex**, Seattle
   *  In CoNLL shared task MRP 2019, over 16 teams, our system on cross-framework meaning representation parsing ranked 1st in AMR parsing task, 5th in UCCA, 6th and 7th in PSD and DM tasks. [Spotlight Talk](https://www.youtube.com/watch?v=5ZMZSfl_Ng0)
- [05/2018 - 08/2018] Research Intern at **[Tecent, WechatAI](https://ai.weixin.qq.com/)**, Palo Alto
   *  Our dialogue system based Gated Attentive Memory Network ranked Top 2 in DSTC7, and got accepted by AAAI 2019 DSTC7 workshop.
- [09/2008 - 03/2012] Research Assistant at **[CGCL Lab, Huazhong University of Science and Technology](http://grid.hust.edu.cn/)**, Wuhan
   *  I worked closely with Prof. Xia Xie and Prof. Hai Jin. My research interests are widely around Xen, Xen-ARM virtualization, and distributed computing. We study equipping R language with JVM-based large scale distributed statistical infrastructure, such as Hadoop, Spark.

# Work Experience
- [10/2014 - 07/2015] Assistant Researcher, **SOHU RDC Lab**, Beijing
    *  Hadoop, Spark, Data migration, Data security, Distributed machine learning 
- [07/2013 - 06/2014] Senior Software Engineer, **ZUN CLUB (Startup)**, Beijing
    *  Heterogeneous data intergration, Hotel recommendation system.
- [03/2012 - 06/2013] Software Engineer, **Baidu**, Beijing
    *  Voice Assistant, Mobile Search, Speed optimization, Mobile Anti-Attack
- [08/2010 - 05/2011] Software Engineer Intern, **Alibaba**, Hangzhou
    *  KV Storage, MySQL, Database Replication, Real-time Computing, Distributed Pub/Sub Data Pipeline.

# Teaching & Mentoring
- Fall 2023, U of Colorado Boulder, Instructor, co-teaching ([CSCI-LING 5832](https://canvas.colorado.edu/courses/95371/)) with James Martin.
- 2019-2020, U of Utah, Mentoring [Tarun Sunkaraneni](https://tsunny007.github.io/), Bachelor Thesis on ['Transformer-based Observers in Psychotherapy'](https://www.cs.utah.edu/docs/techreports/2020/pdf/UUCS-20-011.pdf)
- Fall 2018, U of Utah, TA for CS 6350 Machine Learning
- Spring 2019, U of Utah, TA for CS 6355 Structured Prediction
- Fall 2016, U of Utah, TA for CS 6350 Machine Learning
- 2007-2008, HUST, Leader for Algorithm & Game Team in a student innovation organization, [Unique Studio](https://hustunique.com/)


# Academic Service
- PC Member / Reviewers for [MRP'2019](http://mrp.nlpl.eu/2019/), [BEA'23](https://aclanthology.org/venues/bea/), [NLP4ConvAI'23](https://www.aclweb.org/portal/content/call-papers-5th-workshop-nlp-conversational-ai), [AmericasNLP'23](https://turing.iimas.unam.mx/americasnlp/2023_st.html), [SLaTE'23](https://sites.google.com/view/slate2023), ACL'20-23, EMNLP'20-23, NAACL'21, EACL'21,24, COLING'(20,22,24), AAAI'19-24, ACL Rolling Review'21-23, AIED'23, EDM'24

# Honors and Awards
- [2023] iSAT Trainee Grant 2023 on Conversational Simulation on Small-group Discussion. 
- [2019] CoNLL Shared Task, Cross-framework meaning representation parsing, ranked 1st(over 16 teams) for AMR parsing task.
- [2018] DSTC7 track1, ranked 2nd for both advising and ubuntu in subtask 5(with external knowledge)
- [2015] Our system ['Talking Geckos'](https://www.slideshare.net/jiessiecao/talking-geckos-question-and-answering) winned 1st in a question-answering competition during Fall 2015 NLP class.
- [2010] VMware Cloud Computing Innovation Cup, Top 50
- [2009] Google Andriod Innovative Idea Sharing Award
- [2007] "Computer World" Magazine Scholarship (50 students per year in China)
- [2007] Microsoft ImagineCup
    *  Algorithm Challenge, Top 50 
    *  Visual Gaming Contest(Project Hoshimi), Top 2 in China, 18th in world final.
- [2006] HUST ACM Programming Contest, Top 3


