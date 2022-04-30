install.packages("ggforce")
install.packages("ggplot")
install.packages("ggplot2")
library(tidyverse)
library(ggforce)
library(ggplot2)
library(reshape2)
library(ggplot)
library(readxl)
library(tidyr)
library(forcats)
library(purrr)
install.packages("colorspace")
install.packages("dplyr")
getwd()

set.seed(12345)

rm(bigtitanic)

#setting the dataset to 200 observations
Tidy_HIV <- HIV_rate_africa[sample(1:nrow(HIV_rate_africa), 200), ]

#Removing unwanted column
Tidy_HIV$V1 <- NULL
Tidy_HIV$V2 <- NULL



Tidy_HIV <- Tidy_HIV[, order(names(Tidy_HIV))]

#order integer columns in ascending order
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V3),]
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V4),]
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V6),]
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V7),]
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V8),]
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V9),]
Tidy_HIV <- Tidy_HIV [order(Tidy_HIV$V10),]




#Graph 1, effects of class on survival  rates
library(ggplot2)
#create decade
Tidy_HIV['decade']=Tidy_HIV$V3-Tidy_HIV$V3%%10

HIVdf= sqldf("select V3, V4, V5, avg(V6), from timedf group by decade")

ggplot(Tidy_HIV, aes(x = V3, y =V9)) +
  geom_bar(stat='identity', width=0.4, position = position_dodge(width=0.5)) +
  labs(y = "count of children",
       x = "years",
       title = "Distribution of young people living with HIV in subsaharan Africa",
       subtitle = 'Density chart showing the number of underage people living with HIV from 1991 - 2020',
  )



theme_set(theme_classic())

#Graph 2, shows the survival rate of the sexes
  ggplot(Tidy_HIV, aes(x = V3, fill = V4)) +
  geom_line() +
  labs(y = "count",
       x = "Survival rate of passengers",
       title = "Tidy Titanic survival rate by sex",
       subtitle = 'the survival rate of the 200 passenger by sex',
  )


#Graph 3 Effect of age on survival rate 

  ggplot(aes(x = age, colour = survived)) +
  geom_density(alpha = 0.2) +
  labs(y = "count",
       x = "Survival rate of passengers",
       title = "Tidy Titanic survival rate by age Density chart",
       subtitle = 'the survival rate of the 200 passenger by age',
  )



View(bigtitanic)

write.csv(ordered_titanic,"C:\\Users\\customer1\\Documents\\Year 4 Semester 2\\visualising data assignment\\assignment\\titanic.csv", row.names = FALSE)