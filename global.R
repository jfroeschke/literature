## global.R
library(shiny)
library(DT)
library(rmarkdown)
library(yaml)
lit <- read.csv("lit.csv")

kable(lit$Citation, format = "html")

kable(head(iris), format = "html")