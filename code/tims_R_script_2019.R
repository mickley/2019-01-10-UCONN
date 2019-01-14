
#-------------------------------------------------------------------------------#
# Welcome to this Software Carpentry Workshop hosted by UConn's EEB Department! #
#-------------------------------------------------------------------------------#


# Using R as a calculator
53 + 23

# The order of operations
# ()
# ^ **
# /
# *
# +
# -

3 + 5 * 2
(3+5) * 2

# R has build some built-in expressions
log(1)
log10(10)
exp(0.5)

log()

x <- 1/40

x

x <- x +1
y <- x * 2  


# assigning variables
this.is.my.variable.name <- 100
new_variables <- 100


# what is the final value of mass and age?
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass
age


1:5
2^(1:5)

x <- 1:4
y <- 5:8
x + y

# some useful functions
ls() # list all object in your current environment
rm("x") # remove an object from your current environment
rm(y)
ls()

# romove all objects from your current environment
rm(list = ls())
ls() # check that they are all gone


installed.packages() # get a list of packages you have installed
#install.packages("package.name")

# how to install packages, in this case 2 packages at once
install.packages(c("ggplot2", "dplyr"))

# can be used to update packages - use with caution
# many packages = could take a while
update.packages()

# load a package for your current session
library(ggplot2)


# finding help
?log
help(log)

# fuzzy search
??read.ta

?"<-"

# vignettes are also really useful, with examples and test data
vignette("coin")

# to post to StackOverflow, its a good idea to have some # information about your computer and session info
?dput
sessionInfo()  



# Data Structures

# create a data frame
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
cats

# save a csv file to the data folder
write.csv(cats, "data/feline_data.csv")

# read in a csv file from the data folder
cats <- read.csv("data/feline_data.csv")

# look at individual columns
cats$weight
cats$coat

# modify values in columns
cats$weight <- cats$weight*2.2
cats$weight

cats$weight + cats$coat

class(cats$weight)
class(cats$coat)
cats$coat

class(cats)
str(cats)

# vectors
num_vector <- c(1, 3, 5) # numeric vector
chr_vector <- c("a", "b", "c") # character vector
chr_vector2 <-c("d", "e", "f")


# can combine vectors of the same type using c()
comb_vector <- c(chr_vector, chr_vector2)
comb_vector


num_vector2 <- c(100, 10, 20)

num_vector + num_vector2

my_series <- 1:10
my_series

# using the seq function
seq(10)
seq(from = 1, to = 10, by = 0.1)

# naming vectors - useful for some applications
my_example <- 5:8
names(my_example) <- c("a", "b", "c", "d")
my_example
names(my_example)


nums <- 1:26
nums <- nums*2
names(nums) <- letters
nums

# working with a real data frame
gapminder <- read.csv("data/gapminder_data.csv")

#alternative way to access the data
# need to have the package loaded first

library(gapminder) # load package
data("gapminder") # get data into R session
attach(gapminder) # attach the data

# looking at the structure of the data
str(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder) # dimensions
colnames(gapminder)

# Subsetting data
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x

x[1]
x[3]

x[c(1, 3)]
x[1:4]

x[6]

x[-2]
x[-(2:4)]

head(gapminder["pop"])
head(gapminder[,5])

gapminder[3, ]

gapminder[1:10, 5]

# square brackets index elements in lists and data frames, i.e., 
# [rows,columns]

# life expectancy on line 138:
gapminder[138, ]
# select first six rows of numeric columns only
str(gapminder)

gapminder[1:6, 3:6]

gapminder[1:6, c("pop", "lifeExp", "year", "gdpPercap")]

# subset the gapminder data to albania, based on rows and columns
albania <- gapminder[13:24, 1:6]
albania

