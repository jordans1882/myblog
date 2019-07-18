knitr::knit('iris.rmd', 'iris.html')

rmarkdown::render('iris.rmd', "all")

library(rmarkdown)

render("iris.rmd", output_file = "iris.html")



