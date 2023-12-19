---
title: word2vec
date: 2023-10-28 15:14:58
# excerpt:
category: NLP
---

## What

2013年，Google开源的，用于词向量计算的工具

## 架构

X -- Dense -- Dense -- Softmax -- Y

CBoW: 利用上下文预测当前词

Skip-gram: 利用当前词预测上下文

