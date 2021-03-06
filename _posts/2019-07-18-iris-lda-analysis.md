---
layout: post
title:  "Iris Datases"
author: "Jordan Schupbach"
categories: [jekyll, rstats]
tags: [blogdown, knitr, servr, httpuv, websocket]
---

{% include lib/mathjax.html %}







Introduction
============

The famous [@fisher:1936] (or [@anderson:1936]) iris data set gives the
measurements (in centimeters) of the sepal length and width, and petal length
and width for 50 flowers, each from one of three species of iris. The species
are *I. setosa*, *I versicolor*, and *I. virginica*. We provide images for each of the
three species in Figure (cite here). Researchers are interested in whether they can
identify the species from the set of the four measurements taken on the plants.
For this study, the focus is only on predicting *I. Setosa* versus *I. Versicolor.*

Description of Data
-------------------

This dataset has 1 categorical variable (species) and 4 quantitative variables
(sepal length and width, and petal length and width; all measured in
centimeters). Again, the researchers are interested in predicting species from
the four measurements. We provide the first six lines of the dataset in Table
(ref here) and a five-number summary of the data in Table (ref here).
We also may want to subset our data by species and look at summary statistics.
Means for the two species of interest are given in Table (ref here).

These data were gathered by Dr. Edgar Anderson. The *Iris setosa*
and *Iris versicolor* were found growing together in the same colony.
The third species, *Iris virginica*, was from a different colony, as it
would be a ``circumstance which might considerably disturb both the mean values
and their variabilities.''

Statistical Methods Used
========================

To classify the two species of interest, *I. setosa* and *I. versicolor*, we use the
method of linear discriminant analysis following [@fisher:1936]. One assumption
of the method is that the covariates be independently normally distributed. We
check the assumption of normality by plotting histograms of four variables grouped
by species type in Figure (ref here). Further, we provide beanplots from
the *beanplot* R package [@beanplot], which assume a normal kernel
density. The two figures would suggest the assumption of normality is
reasonably met.

Linear discriminant analysis allows us to write an objective function of the form

$$ X = \lambda_1 x_1 + \lambda_2 x_2 + \lambda_3 x_3 + \lambda_4 x_4 $$

for which we classify an observation as either *I. Setosa* or *I. Versicolor*
depending on its value.

Summary of Statistical Findings
===============================

We provide means for the two groups in Table (ref here). The LDA was
conducted in R [@r] using the *lda()* function from the
*MASS* package [@mass:2002]. Coefficients of discrimination are
given in Table (ref here). We see that we can write equation
(ref here) as

$$ X = -1.77 x_1 - 0.3 x_2 + 3.04 x_3 + 2.14 x_4 $$

Following [@fisher:1936], we can take the coefficient for sepal width to be
unity (see Table (ref here)) and rewrite equation (ref here)
as

$$ X = x_1 + 0.17 x_2 - 1.71 x_3 - 1.21 x_4 $$

These equations can be used to score each observation on this new scale, and
classify the observation as either *I. setosa* or *I. virginica*. Figure
(ref here) shows the values of the scores for the two species according
to equation (ref here). We can see from the plot that the scores do an
impressive job in separating *I. setosa* and *I. virginica*. A confusion matrix
is given in Table (ref here). We see that the equation can perfectly separate
*I. setosa* plants from *I. virginica*.

Scope of Inference
==================

Since we did not randomly assign any treatment to treatment groups, no causal
inference can be inferred in this study. Further, since observations did not
come from a random sample, we cannot infer to a larger population than that
of the sample.


Appendix
========

Tables
------

<center>
<table>
<caption>First 6 lines of the dataset</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Sepal.Length </th>
   <th style="text-align:right;"> Sepal.Width </th>
   <th style="text-align:right;"> Petal.Length </th>
   <th style="text-align:right;"> Petal.Width </th>
   <th style="text-align:left;"> Species </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 5.1 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:left;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4.9 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:left;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4.7 </td>
   <td style="text-align:right;"> 3.2 </td>
   <td style="text-align:right;"> 1.3 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:left;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4.6 </td>
   <td style="text-align:right;"> 3.1 </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:left;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 3.6 </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:left;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5.4 </td>
   <td style="text-align:right;"> 3.9 </td>
   <td style="text-align:right;"> 1.7 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:left;"> setosa </td>
  </tr>
</tbody>
</table>
</center>

<br/>

<center>

<table style="text-align:center"><caption><strong>Summary table of the four quantitative variables</strong></caption>
<tr><td colspan="8" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Statistic</td><td>N</td><td>Mean</td><td>St. Dev.</td><td>Min</td><td>Pctl(25)</td><td>Pctl(75)</td><td>Max</td></tr>
<tr><td colspan="8" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Sepal.Length</td><td>150</td><td>5.843</td><td>0.828</td><td>4.300</td><td>5.100</td><td>6.400</td><td>7.900</td></tr>
<tr><td style="text-align:left">Sepal.Width</td><td>150</td><td>3.057</td><td>0.436</td><td>2.000</td><td>2.800</td><td>3.300</td><td>4.400</td></tr>
<tr><td style="text-align:left">Petal.Length</td><td>150</td><td>3.758</td><td>1.765</td><td>1.000</td><td>1.600</td><td>5.100</td><td>6.900</td></tr>
<tr><td style="text-align:left">Petal.Width</td><td>150</td><td>1.199</td><td>0.762</td><td>0.100</td><td>0.300</td><td>1.800</td><td>2.500</td></tr>
<tr><td colspan="8" style="border-bottom: 1px solid black"></td></tr></table>
</center>

<br/>

<center>
<table>
<caption>Group means</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Sepal.Width </th>
   <th style="text-align:right;"> Sepal.Length </th>
   <th style="text-align:right;"> Petal.Width </th>
   <th style="text-align:right;"> Petal.Length </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> setosa </td>
   <td style="text-align:right;"> 3.428 </td>
   <td style="text-align:right;"> 5.006 </td>
   <td style="text-align:right;"> 0.246 </td>
   <td style="text-align:right;"> 1.462 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> versicolor </td>
   <td style="text-align:right;"> 2.770 </td>
   <td style="text-align:right;"> 5.936 </td>
   <td style="text-align:right;"> 1.326 </td>
   <td style="text-align:right;"> 4.260 </td>
  </tr>
</tbody>
</table>
</center>

<br/>

<center>
<table>
<caption>Coefficients of linear discriminants</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> LD1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Sepal.Width </td>
   <td style="text-align:right;"> -1.773845 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sepal.Length </td>
   <td style="text-align:right;"> -0.300458 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Petal.Width </td>
   <td style="text-align:right;"> 3.035726 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Petal.Length </td>
   <td style="text-align:right;"> 2.142260 </td>
  </tr>
</tbody>
</table>
</center>

<br/>


<center>
<table>
<caption>Coefficients of linear discriminants with first scaled to unity</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> LD1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Sepal.Width </td>
   <td style="text-align:right;"> 1.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sepal.Length </td>
   <td style="text-align:right;"> 0.1693823 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Petal.Width </td>
   <td style="text-align:right;"> -1.7113818 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Petal.Length </td>
   <td style="text-align:right;"> -1.2076926 </td>
  </tr>
</tbody>
</table>
</center>

<br/>

<center>
<table>
<caption>Confusion matrix</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> setosa </th>
   <th style="text-align:right;"> versicolor </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> setosa </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> versicolor </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 50 </td>
  </tr>
</tbody>
</table>
</center>

Figures
-------

<img src="/myblog/figure/source/iris-lda-analysis/2019-07-18-iris-lda-analysis/irises-1.png" title="Three species of iris: I. Setosa, I. Virginica, I. Versicolor" alt="Three species of iris: I. Setosa, I. Virginica, I. Versicolor" style="display: block; margin: auto;" />

<img src="/myblog/figure/source/iris-lda-analysis/2019-07-18-iris-lda-analysis/pairsplot-1.png" title="A matrix of scatterplots of the quantitative variables" alt="A matrix of scatterplots of the quantitative variables" style="display: block; margin: auto;" />

<img src="/myblog/figure/source/iris-lda-analysis/2019-07-18-iris-lda-analysis/histograms-1.png" title="Histograms of covariates separated by species" alt="Histograms of covariates separated by species" style="display: block; margin: auto;" />

<img src="/myblog/figure/source/iris-lda-analysis/2019-07-18-iris-lda-analysis/sep-1.png" title="Beanplots of the four quantitative variables by species" alt="Beanplots of the four quantitative variables by species" style="display: block; margin: auto;" />

<img src="/myblog/figure/source/iris-lda-analysis/2019-07-18-iris-lda-analysis/scores-1.png" title="Linear discriminant scores for setosa and versicolor" alt="Linear discriminant scores for setosa and versicolor" style="display: block; margin: auto;" />

R-code
------


{% highlight r %}
# Subset the data
iris_sub <- subset(iris, iris$Species == "setosa" |
                   iris$Species == "versicolor")
iris_sub$Species <- factor(iris_sub$Species)
head(iris_sub)

# LDA
z <- lda(Species ~ Sepal.Width + Sepal.Length + Petal.Width +
         Petal.Length, iris_sub, prior = c(1,1)/2)
preds <- predict(z)$class

## Tables:
# Table 1
head(iris)
print(xtable(head(iris), caption = "First 6 lines of the dataset",
             label = "data-head"),
      comment = FALSE)

# Table 2
summary(iris)
stargazer(iris, iqr = TRUE,
          type = "latex", header = FALSE, label = "summary",
          title = "Summary table of the four quantitative variables")

# Table 3
z$mean
print(xtable(z$mean, label = "means-tbl", caption = "Group means"),
      comment = FALSE)

# Table 4
z$scaling
print(xtable(z$scaling, label = "scaling-tbl",
             caption = "Coefficients of linear discriminants"),
      comment = FALSE)

# Table 5
(1/z$scaling[1]) * z$scaling
print(xtable((1/z$scaling[1]) * z$scaling, label = "scaling-unity-tbl",
  caption = "Coefficients of linear discriminants with first scaled to unity"),
      comment = FALSE)

# Table 6: Confusion Matrix
table(preds, iris_sub$Species)
print(xtable(table(preds, iris_sub$Species), label = "confusion",
             caption = "Confusion matrix"),
      comment = FALSE)

## Figures
# Figure 1:
fig1 <- rasterGrob(readPNG("images/iris_setosa.png"), interpolate=TRUE)
fig2 <- rasterGrob(readPNG("images/iris_virginica.png"), interpolate=TRUE)
fig3 <- rasterGrob(readPNG("images/iris_versicolor.png"), interpolate=TRUE)
grid.arrange(fig1, fig2, fig3, ncol=3)

# Figure 2:
par(mar = c(5,4,4,3))
pairs.panels(iris[,1:4],
             labels = c("Sepal Length",
                        "Sepal Width",
                        "Petal Length",
                        "Petal Width"),
             bg=c("red",
                  "blue",
                  "green")[iris$Species],
             pch=20+as.numeric(iris$Species),
             ellipses = FALSE,
             oma=c(4,4,6,12))
par(xpd=TRUE)
legend(.9*par("usr")[2],  ## 1.05 times x1 limit
       .7*par("usr")[4],   ## .8 times y2 limit
       levels(iris$Species),
       pch = c(21,22,23),
       pt.bg = c("red", "blue", "green"))

# Figure 3:
plot1 <- ggplot(iris, aes(x=Sepal.Length))
plot1<- plot1 + geom_histogram(aes(fill = Species))
plot2 <- ggplot(iris, aes(x=Sepal.Width))
plot2<- plot2 + geom_histogram(aes(fill = Species))
plot3 <- ggplot(iris, aes(x=Petal.Length))
plot3<- plot3 + geom_histogram(aes(fill = Species))
plot4 <- ggplot(iris, aes(x=Petal.Width))
plot4<- plot4 + geom_histogram(aes(fill = Species))
theme_set(theme_gray(base_size = 18))
m<-grid.arrange(plot1,plot2, plot3,plot4, ncol=2)
print(m)


# Figure 4:
par(mfrow = c(2,2))
beanplot(Sepal.Length ~ Species, data = iris, ylab = "Sepal Length",
         xlab = "Species", col = "beige", method = "jitter")
beanplot(Sepal.Width ~ Species, data = iris, ylab = "Sepal Width",
         xlab = "Species", col = "beige", method = "jitter")
beanplot(Petal.Length ~ Species, data = iris, ylab = "Petal Length",
         xlab = "Species", col = "beige", method = "jitter")
beanplot(Petal.Width ~ Species, data = iris, ylab = "Petal Width",
         xlab = "Species", col = "beige", method = "jitter")

# Figure 5:
plot(z)
{% endhighlight %}

Document Creation Info
----------------------


References
=========
