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

My research is primarily focused on **Natural Language Processing**, particularly in the area of **Dialogue** and **Structured Prediction**.
- **Modularized NLP.** As AI challenges become increasingly complex, I'm keen on developing modularized AI systems tailored for future large-scale projects with more collaboration and uncertainties. My research spans formal language representation, neuro-symbolic interfaces, and ensuring differentiability while decomposing and integrating submodules like LLMs into a cohesive AI system. This includes deep structured prediction ([Dissertation'22](https://www.proquest.com/docview/2777357718?pq-origsite=gscholar&fromopenview=true),
           [CoNLL'19](https://aclanthology.org/K19-2013/),
           [ACL'19](https://aclanthology.org/P19-1563/),
           [NAACL'21](https://aclanthology.org/2021.naacl-main.62/),
           [IWSDS'23](https://arxiv.org/abs/2302.12944)), controllable generation with constraints ([DSTC7'19](http://workshop.colips.org/dstc7/papers/13.pdf), [ACL'19](https://aclanthology.org/P19-1192/),[BEA'23](https://aclanthology.org/2023.bea-1.47/)).
- **Learning with Minimal Supervision.** In practical applications, we often have limited supervision because data is scarce, high-quality annotations are time-consuming, and trial-and-error verification are expensive. I investigate *foundational structures and principles*, both within and beyond language, which are critical for creating efficient and reliable AI systems, especially in domains like Education and Health. I studied graph-based parsing via latent anchoring analysis([CoNLL'19](https://aclanthology.org/K19-2013)),
      tree-structure database query plan characterization via self-supervised contrastive learning ([VLDB'22](https://dl.acm.org/doi/10.14778/3503585.3503600)),
      zero-shot dialogue state tracking via description-driven
      learning and supplementary pretraining ([NAACL'21](https://aclanthology.org/2021.naacl-main.62/)), and LLM finetuning ([L@S'24](https://dl.acm.org/doi/10.1145/3657604.366466://dl.acm.org/doi/10.1145/36576043664664)), etc.
- **Deployment in Real-world Scenarios.** The complex environment of the real world often makes our model fall short when faced with different input distributions ([ACL'23](https://aclanthology.org/2023.acl-short.156)), uncertain conversational dynamics, unnoticed non-verbal behavior ([AIAIC'23](https://aichildinteraction.github.io/preprint/AIAIC23_paper_7399.pdf)), noisy speech in small-group classroom ([UMAP'23](https://dl.acm.org/doi/10.1145/3565472.3595606)),
      multi-party, multi-modal dynamics ([IWSDS'23](https://arxiv.org/abs/2302.12944)),
      and conversational simulation.


# News
- 08/2024: I'll be joining [University of Oklahoma](https://www.ou.edu/) as an Assistant Professor in the [School of Computer Science](https://www.ou.edu/coe/cs) starting Fall 2024.
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
- [09/2022 - 08/2024] Postdoctoral Research Associate at [NSF AI Institute for Student-AI Teaming(iSAT)](https://www.colorado.edu/research/ai-institute/), CU Boulder.
    * I mainly worked with [James Martin](https://home.cs.colorado.edu/~martin/), [Martha Palmer](https://www.colorado.edu/faculty/palmer-martha/), and [Boulder NLP Group](https://colorado.edu/lab/clear/). I worked on AI for Education, e.g.. collaborative learning and tutoring.
- [08/2015 - 08/2022] Research Assistant at **Utah NLP Lab, Univeristy of Utah**, Salt Lake City
   * I obtained my Ph.D. from the [Kahlert School of Computing](https://cs.utah.edu/) at [University of
        Utah](https://www.ou.edu), where I worked with [Vivek
        Srikumar](https://svivek.com) and [Uath NLP Group](https://nlp.cs.utah.edu). My Ph.D. dissertation is on [inductive biases on deep linguistic structured predictions](https://www.proquest.com/docview/2777357718?pq-origsite=gscholar&fromopenview=true).
- [06/2020 - 12/2020] Applied Scientist II Intern at **AWS AI, Amazon Lex**, Remote
   *  Our paper on schema-guided dialog got accepted by NAACL 2021.
- [06/2019 - 09/2019] Applied Scientist Intern at **AWS AI, Amazon Lex**, Seattle
   *  In CoNLL shared task MRP 2019, over 16 teams, our system on cross-framework meaning representation parsing ranked 1st in AMR parsing task, 5th in UCCA, 6th and 7th in PSD and DM tasks. [Spotlight Talk](https://www.youtube.com/watch?v=5ZMZSfl_Ng0)
- [05/2018 - 08/2018] Research Intern at **[Tecent, WechatAI](https://ai.weixin.qq.com/)**, Palo Alto
   *  Our dialogue system based Gated Attentive Memory Network ranked Top 2 in DSTC7, and got accepted by AAAI 2019 DSTC7 workshop.
- [09/2008 - 03/2012] Research Assistant at **[CGCL Lab, Huazhong University of Science and Technology](http://grid.hust.edu.cn/)**, Wuhan
   *  I worked closely with Prof. Xia Xie and Prof. Hai Jin. My research interests are widely around Xen, Xen-ARM virtualization, and distributed computing. We study equipping R language with JVM-based large scale distributed statistical infrastructure, such as Hadoop, Spark.

# Academic Service
- Standing Reviewer for Journals: [Computational Linguistics](https://submissions.cljournal.org/index.php/cljournal)
- PC Member / Reviewer for Conferences and Workshops: ACL'(20-24), EMNLP'(20-24), NAACL'(21-25), EACL'21,24, COLING'(20,22,24), CoNLL'(19-24), COLM'24, AAAI'(19-25), ACL Rolling Review'21-24, AIED'(23-24), EDM'(23-24), [MRP'2019](http://mrp.nlpl.eu/2019/), [BEA](https://aclanthology.org/venues/bea/), [NLP4ConvAI](https://www.aclweb.org/portal/content/call-papers-5th-workshop-nlp-conversational-ai), [AmericasNLP'23](https://turing.iimas.unam.mx/americasnlp/2023_st.html), [SLaTE'23](https://sites.google.com/view/slate2023)
