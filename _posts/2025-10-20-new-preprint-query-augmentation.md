---
layout: page
subheadline: "New Preprint"
title: "Rethinking On-policy Optimization for Query Augmentation"
teaser: "Our new preprint on query augmentation for information retrieval is now available on arXiv."
categories: [research]
tags: [information-retrieval, query-augmentation, large-language-models, reinforcement-learning]
comments: false
---

We are excited to announce our new preprint **"Rethinking On-policy Optimization for Query Augmentation"** is now available on [arXiv](https://arxiv.org/abs/2510.17139)!

## About the Work

Recent advances in large language models (LLMs) have led to a surge of interest in query augmentation for information retrieval (IR). In this work, we present the first systematic comparison of prompting-based and RL-based query augmentation across diverse benchmarks, including evidence-seeking, ad hoc, and tool retrieval.

## Key Findings

Our key finding is that **simple, training-free query augmentation often performs on par with, or even surpasses, more expensive RL-based counterparts**, especially when using powerful LLMs.

## Novel Contribution: OPQE

Motivated by this discovery, we introduce a novel hybrid method, **On-policy Pseudo-document Query Expansion (OPQE)**, which, instead of rewriting a query, the LLM policy learns to generate a pseudo-document that maximizes retrieval performance, thus merging the flexibility and generative structure of prompting with the targeted optimization of RL.

We show that **OPQE outperforms both standalone prompting and RL-based rewriting**, demonstrating that a synergistic approach yields the best results.

## Authors

- **Zhichao Xu** (First Author)
- **Shengyao Zhuang**
- **Xueguang Ma**
- **Bingsen Chen**
- **Yijun Tian**
- **Fengran Mo**
- **Jie Cao** (Corresponding Author)
- **Vivek Srikumar**

## Links

- **arXiv**: [https://arxiv.org/abs/2510.17139](https://arxiv.org/abs/2510.17139)
- **DOI**: [https://doi.org/10.48550/arXiv.2510.17139](https://doi.org/10.48550/arXiv.2510.17139)

## Abstract

Recent advances in large language models (LLMs) have led to a surge of interest in query augmentation for information retrieval (IR). Two main approaches have emerged. The first prompts LLMs to generate answers or pseudo-documents that serve as new queries, relying purely on the model's parametric knowledge or contextual information. The second applies reinforcement learning (RL) to fine-tune LLMs for query rewriting, directly optimizing retrieval metrics. While having respective advantages and limitations, the two approaches have not been compared under consistent experimental conditions. In this work, we present the first systematic comparison of prompting-based and RL-based query augmentation across diverse benchmarks, including evidence-seeking, ad hoc, and tool retrieval. Our key finding is that simple, training-free query augmentation often performs on par with, or even surpasses, more expensive RL-based counterparts, especially when using powerful LLMs. Motivated by this discovery, we introduce a novel hybrid method, On-policy Pseudo-document Query Expansion (OPQE), which, instead of rewriting a query, the LLM policy learns to generate a pseudo-document that maximizes retrieval performance, thus merging the flexibility and generative structure of prompting with the targeted optimization of RL. We show OPQE outperforms both standalone prompting and RL-based rewriting, demonstrating that a synergistic approach yields the best results. Our implementation is made available to facilitate reproducibility.

---

*This preprint represents ongoing research in the intersection of large language models and information retrieval. We welcome feedback and collaboration opportunities.*
