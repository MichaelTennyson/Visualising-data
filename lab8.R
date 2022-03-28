install.packages("ggforce")
library(tidyverse)
library(ggforce)
library(reshape2)
library(ggplot)

getwd()

data <- read.csv('/data.csv')
data <- read.csv("./lab 8/bigtitanic.csv")

ggplot(data, aes(x = age,fill = sex)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "number of passenger on the titanic",
       x = "Age and sex of passengers on the titanic",
       title = "Titanic Age Distribtion Histogram",
       subtitle = 'the number of passengers based on their ages and distuingusihed by sex',
       )



#ACCENT

#Apprehension:
#Ability to correctly perceive relations among variables.
#the graph shows the relation between the number of passengers, the ages and sex

#Clarity:
#Ability to visually distinguish all the elements of a graph.
#the ages and sexes are all distinguished by colour

#Consistency:
#Ability to interpret a graph based on similarity to previous graphs.
#the graph is a regular histogram chart that can be easily understood

#Efficiency:
#Ability to portray a possibly complex relation in as simple a way as possible.
#the data is plotted on a simple histogram that shows the distribution of the ages of people on the titanic based on sex


#Necessity:
#The need for the graph, and the graphical elements.
#Is the graph a more useful way to represent the data than alternatives (table, text)?
# Are all the graph elements necessary to convey the relations?
#The histograms elements all play a role in conveying the data

#Truthfulness:
#Ability to determine the true value represented by any graphical element by its magnitude relative to the implicit or explicit scale.
#Are the graph elements accurately positioned and scaled?


#GESTALT

#Gestalt refers to the patterns that you perceive when presented with a few graphical elements. 
#The graph achieves GESTALT by having a simply x y axis based on age and number of those passenger of the age and sexes,
#The sexes are distinguished by color. overall, what can be taken from

