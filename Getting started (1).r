installed.packages()

# We will be using ggplot, which is in the package ggplot2.  
install.packages("ggplot2")

library(ggplot2)

data(package="datasets")

data(package="ggplot2")

?mtcars

data("mtcars")

head(mtcars)

nrow(mtcars)
ncol(mtcars)

rownames(mtcars)

colnames(mtcars)

summary(mtcars)

str(mtcars)

mtcars$hp

mtcars['hp']

mtcars

mtcars$cyl

unique(mtcars$cyl)

class(mtcars$cyl)

df<-mtcars

df

class(mtcars$gear)
df$gear<-as.factor(df$gear)
class(df$gear)

ggplot(mtcars)

ggplot(mtcars, aes(cyl)) + geom_bar()


p<-ggplot(mtcars, aes(cyl)) 
p<-p+geom_bar()
p

p<-ggplot(mtcars, aes(mpg))
p+geom_bar()
We could make it categorical, by using the as.factor function, but it's still not great!
df<-mtcars
df$mpg<-as.factor(df$mpg)
p<-ggplot(df, aes(mpg))
p+geom_bar()

df<-mtcars
df$mpg<-as.integer(df$mpg)
p<-ggplot(df, aes(mpg))
p+geom_bar()

mtcars$cyl = as.factor(mtcars$cyl)

ggplot(data=mtcars, aes(x=cyl)) + 
  geom_bar() 

ggplot(data=mtcars, aes(cyl)) + 
geom_bar() + 
  coord_polar(theta = "y") 

p = ggplot(data=mtcars, aes(x="", fill = cyl)) + 
  geom_bar() 
p

ggplot(data = mtcars) +
geom_bar(mapping = aes(x = cyl, fill = cyl)) +
coord_polar()

ggplot(data = mtcars) +
geom_bar(mapping = aes(x =cyl, fill = cyl), width = 1) +
coord_polar()

ggplot(data = mtcars) +
geom_bar(mapping = aes(x =cyl, fill = cyl), width = 1) +
labs(x=NULL) +
theme(
    axis.title.y=element_blank(),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank()
) +
coord_polar()

p = ggplot(data=mtcars, aes(x = "", fill = cyl)) + 
  geom_bar() + 
  labs(x=NULL) +
theme(
    axis.title.y=element_blank(),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.background=element_blank()
) +
  coord_polar(theta = "y")
p

?ChickWeight

data("ChickWeight")

str(ChickWeight)

head(ChickWeight)

install.packages("sqldf")
library(sqldf)

Mychicks = sqldf("select * from ChickWeight where Chick = 1")
ggplot(data=Mychicks, aes(x=Time, y=weight)) +
  geom_line()

installed.packages()

# We will be using ggplot, which is in the package ggplot2.  
install.packages("ggplot2")

library(ggplot2)

data(package="datasets")

data(package="ggplot2")

ggplot(data=ChickWeight, aes(x=Diet,y=weight))
+ geom_line()

ggplot(data=ChickWeight, aes(Time)) + 
geom_bar() + 
  coord_polar(theta = "y")
  
p<-ggplot(ChickWeight, aes(Diet)) 
p<-p+geom_bar()
p
  
p = ggplot(data=ChickWeight, aes(x="weight", fill = Diet)) + 
  geom_bar() 
p

