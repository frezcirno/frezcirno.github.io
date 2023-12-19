---
title: 概率论与数理统计
date: 2023-10-27 15:49:13
category:
- [课程笔记, 概率论与数理统计]
tags:
mathjax: true
---

## 随机变量

概率分布函数, 概率密度函数:
$$
F(x) = P(X\leq x),x\in R, \\
F(x) = \int_{-\infty}^{x}f(x)dx
$$

数学期望, 简称期望, 又称为均值, 常用$\mu$表示
$$
E(x) = \mu_x = \int_{-\infty}^{\infty}xf(x)dx
$$


方差, 标准差:
$$
D(X) = Var(X) = E((X-\mu_x)^2) = E(X^2) - \mu_x^2, \\
\sqrt{D(X)} = \sigma_X = \sqrt{E((X-\mu_x)^2)}
$$

协方差: 用于衡量随机变量 X 与 Y 的相关性:
$$
Cov(X, Y) = E[(X-\mu_X)(Y-\mu_Y)]
$$

相关系数: 剔除了两个变量量纲影响、标准化后的协方差:
$$
\rho = \frac{Cov(X,Y)}{\sigma_X \sigma_Y}
$$

## 多维随机变量

联合概率分布, 联合概率密度:
$$
F(x,y) = P(X\leq x, Y\leq y) = \int_{-\infty}^{y}\int_{-\infty}^{x}f(u,v)dudv
$$

边缘分布函数, 边缘概率密度:
$$
F_X(x) = F(x, +\infty), \\
F_Y(y) = F(+\infty, y), \\
f_X(x) = \int_{-\infty}^{+\infty}f(x,y)dy, \\
f_Y(y) = \int_{-\infty}^{+\infty}f(x,y)dx
$$

条件概率密度, 在$Y=y$的条件下:
$$
f_{X|Y}(x,y) = \frac{f(x,y)}{f_Y(y)}
$$

$Z=X+Y$的概率分布:
$$
F_Z(z) = P(Z\leq z) =\iint_{x+y\leq z}f(x,y)dxdy \\
= \int_{-\infty}^{+\infty}f(z-y,y)dy \\
= \int_{-\infty}^{+\infty}f(x,z-x)dx
$$

如果$X$和$Y$独立, 卷积公式:
$$
= \int_{-\infty}^{+\infty}f_X(x)f_Y(z-x)dx
$$

## 参数估计

样本: $X_1, X_2, ..., X_n$, $n$为样本大小/样本容量/样本量

统计量: 完全由样本决定的量

参数估计问题: 根据样本估计概率函数

- 设有了从总体中抽出的独立随机样本$X_1, ..., X_n$, 要依据这些样本去对参数 $\theta_1, ..., \theta_k$ 的未知值作出估计. 当然, 我们也可以只要求估计其中的一部分, 或估计它们的某个已知函数 $g(\theta_1, ..., \theta_k)$

矩估计: pass

最大似然估计:

设总体有分布 $f(X, \theta_1, ...,\theta_k), $X_1, ...,X_n$ 为自这总体中抽出的样本, 则样本$(X_1, ...,X_n)$的分布(即其概率密度函数或概率函数)为
$$
L(X_1, ..., X_n, \theta_1,..., \theta_k) =
    f(X_1, \theta_1, ..., \theta_k)
    f(X_2, \theta_1, ..., \theta_k)
    ...
    f(X_n, \theta_1, ..., \theta_k)
$$

似然函数: 将上式视为$\theta$的函数, 称为似然函数

最大似然估计: 对于已知的样本, 估计最优的$\theta$值，使得似然函数最大化，即为最大似然估计
