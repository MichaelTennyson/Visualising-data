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

?titanic

data("titanic")

str(titanic)

head(titanic)

install.packages("sqldf")
library(sqldf)

install.packages("ggplot2")
data(package="ggplot2")
data(package="datasets")

ggplot(mtcars, aes(cyl)) + geom_bar()

pairs(mpg ~ ., data=mtcars, main = "Relationships Between Variables")

par(mfrow=c(2,2))
plot(finalmodel)

hist(cars$speed)

library(datasets)
library(ggplot2)
str(mtcars)

ggplot(data=mtcars, aes(cyl)) + 
  geom_bar() + 
  coord_polar(theta = "y")

p = ggplot(data=mtcars, aes(x="", fill = cyl)) + 
  geom_bar() 
p

arb.frequency <- table(mtcars$carb)
lbls <- names(carb.frequency)
pct <- round(carb.frequency/sum(carb.frequency)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(carb.frequency,labels = lbls,col=rainbow(length(lbls)), main="Cars/Carb Distribution")

count <- table(mtcars$gear)
barplot(count, main="Car Distribution", xlab="Gears",ylab="Cars",names.arg=c("3", "4", "5"),cex.names=0.8,col=c("green","red","blue"))
