library(ggplot2)
library(fmsb)
library(fmsb)
install.packages("fmsb")
library(fmsb)
install.packages("treemap")
library(treemap)
data(airquality)
data(mtcars)
str(airquality)
library(gapminder)
str(gapminder)
library(sqldf)
gm1952=sqldf("select continent, country,
pop/10000 pop from gapminder where year = 1952")
gm2007=sqldf("select continent, country,
pop/10000 pop from gapminder where year = 2007")



data <- rbind(rep(20,10) , rep(0,10) , data)
head(data)
radarchart(data)

#histogram measuring single variable
p1 <- ggplot(airquality, aes(x=Wind)) + 
  geom_histogram()
p1


#simple comparison
treemap(mtcars,
        index=c("gear","mpg"),
        vSize="mpg",
        type="index"
)

#Multi distribution comparisons
ggplot(mtcars, aes(x = mpg, fill = carb)) +   
  # Draw overlaying histogram
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)