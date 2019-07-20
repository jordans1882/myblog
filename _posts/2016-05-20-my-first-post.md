---
layout: post
title: "My First Post: The Humble Scatterplot"
categories: [jekyll, rstats]
tags: [knitr, servr, httpuv, websocket]
---

This is my first post. Naturally, I will give a scatterplot of the iris dataset.


{% highlight r %}
data(iris)
require(car)
scatterplot(iris$Petal.Length, iris$Petal.Width,groups = iris$Species)
{% endhighlight %}

![plot of chunk plot1](/myblog/figure/source/my-first-post/2016-05-20-my-first-post/plot1-1.png)
