library(tidyverse)#  This library includes ggplot and a few others.
library(sqldf)
library(ggstream)

datasetname = "https://cli.fusio.net/cli/climate_data/webdata/dly532.csv"
dfdub<-read.csv(datasetname)

str(dfdub)

dfdub<-read.csv(datasetname,skip=25)

str(dfdub)

head(dfdub)

unique(dfdub$hg)

sum(is.na(dfdub$hg))

unique(dfdub$ind.1)

nrow(dfdub)

colnames(dfdub)

timedf<-sqldf("select date, maxtp, mintp, rain, ddhm, wdsp,evap, sun from dfdub")
str(timedf)

timedf1<-sqldf("select date, maxtp, mintp, rain, ddhm, sun, wdsp from dfdub")

unique(dfdub$ddhm)
sum(is.na(dfdub$ddhm))

sqldf("select * from timedf where ddhm is null")

timedf = sqldf("Select * from timedf where date>='01-jan-1950'")

timedf['ISODate']= timedf['date']
timedf$ISODate= 
as.POSIXct(
    strptime(
        timedf$ISODate, 
        format = "%d-%b-%Y"))#Note for month in mmm format, %b is the format.

head(timedf)

timedf['month']=x_month <- format(timedf$ISODate, "%b")  #Note %m gives month number
timedf['year']=x_month <- as.numeric(format(timedf$ISODate, "%Y") ) #note %y gives 2-digit year
str(timedf)

head(timedf)

timedf[which(timedf$ISODate<as.Date('1942-01-06')),]

timedf['decade']=timedf$year-timedf$year%%10
str(timedf)
unique(timedf$decade)

DecadeTemp = sqldf("select decade, avg(maxtp) meant from timedf group by decade")

ggplot(DecadeTemp, aes(x=decade, y=meant, fill = meant))+geom_bar(stat='identity')

rainTemp = sqldf("select decade, avg(rain) rain from timedf group by decade")

windSpeeds = sqldf("select year, avg(wdsp) windspeed from timedf group by year")

MayTemp = sqldf("select year, wdsp, '5' month from timedf where month = 5")



ggplot(timedf, aes(x=decade, y=maxtp, fill = decade))+geom_bar(stat='identity')

#baarchart showing the avg rain rate per decade
ggplot(rainTemp, aes(x=decade, y=rain, fill = decade)) + geom_bar(stat = 'identity')

#the months are listed in alpahbetical order, this must be changed
timedf$month <- factor(timedf$month, levels = month.abb)

#stacked barchart
ggplot(timedf, aes(x=year, y=wdsp, fill=month, color=month)) +
  
  geom_bar(stat='identity') +theme_classic()

#MayWind
MayWind = sqldf(
  "select year, wdsp, '5' month from timedf where month = 5")
head(MayWind)

#groups the average minimun temperate with years
lowTemp = sqldf("select year, avg(mintp) mintp from timedf group by year")

#groups the average minimun temperate with decades
lowTempByDecade = sqldf("select year, decade,avg(mintp) mintp from timedf group by decade")

#rain by decade
rainByMonth = sqldf("select year, decade,avg(rain) avgrain from timedf group by decade")

#linechart
ggplot(lowTempByDecade, aes(x=year, y=mintp, fill=year))+geom_line()

#small multiples
ggplot(data = timedf, aes(x = decade, y = sun)) + 
  geom_bar(stat='identity') +
  facet_grid(facets = .~decade) +
  theme_classic()

#Stacked area chart
ggplot(data = timedf, aes(x = decade, y = mintp, fill = month, color=month)) + 
  geom_stream()+theme_classic()

timedf$month <- factor(timedf$month, levels = month.abb)

#multi-line chart
p2 = ggplot(data=dfdiet,aes(x=Time,y=MeanWt, colour=Diet,fill=Diet)) + 
  geom_line(size=2)+theme_classic()
p2

#stream chart
p3 = ggplot(data=timedf,aes(x=year,y=maxtp, colour=month,fill=month)) + 
  geom_stream()+theme_classic()
p3



dublinairport_dataset <- "./data/mly532.csv"
dfair<-read.csv(dublinairport_dataset,skip=19)
str(dfair)

JanTemp = sqldf(
    "select year, meant, '1' month from dfair where month = 1")
head(JanTemp)

JunTemp = sqldf("select year, meant, '6' month from dfair where month = 6")
head(JunTemp)

ggplot(JanTemp, aes(x=year, y=meant))+geom_line()

ggplot(JunTemp, aes(x=year, y=meant))+geom_line()

df=sqldf("select * from JanTemp union select * from JunTemp")

head(df)

str(df)

ggplot(df, aes(x=year, y=meant)) +

    facet_grid(facets = month~.) +
geom_line() +theme_classic()


ggplot(df, aes(x=year, y=meant, fill=month)) +

geom_bar(stat='identity') +theme_classic()




dfall<-sqldf("select year, meant, month from dfair")

ggplot(dfall, aes(x=year, y=meant, fill=month)) +

geom_bar(stat='identity') +theme_classic()

dfall$month=as.factor(dfall$month)
str(dfall)

ggplot(dfall, aes(x=year, y=meant, fill=month)) +

geom_area() +theme_classic()

ggplot(data = dfall, aes(x = year, y = meant, fill = month, colour=month)) + 
    geom_line()+theme_classic()

ggplot(data = dfall, aes(x = year, y = meant, fill = month, colour=month)) + 
    geom_stream()+theme_classic()

ggplot(data = dfall, aes(x = year, y = meant)) + 
geom_bar(stat='identity') +
facet_grid(facets = month~.) +
       theme_classic()

ggplot(data = dfall, aes(x = year, y = meant)) + 
geom_bar(stat='identity') +
facet_grid(facets = .~month) +
       theme_classic()

str(df)

data(ChickWeight)

df<-ChickWeight
head(df)

df = as.data.frame(ChickWeight)
df['ChickInt']=df['Chick']
str(df)

df$ChickInt=as.numeric(df$ChickInt)
str(df)

dfdiet<-sqldf("select diet, avg(weight) MeanWt, Time from df group by Diet,Time")
head(dfdiet)

df <-sqldf("select Time, Chick, weight from df where ChickInt < 5")
str(df)

unique(df$Chick)

ggplot(data=df,aes(x=Time,y=weight, fill=Chick)) + geom_bar(stat='identity')

p = ggplot(data=df,aes(x=Time,y=weight, colour=Chick,fill=Chick)) + 
geom_line(size=2)+theme_classic()
p

str(dfdiet)

p2 = ggplot(data=dfdiet,aes(x=Time,y=MeanWt, colour=Diet,fill=Diet)) + 
geom_line(size=2)+theme_classic()
p2

p3 = ggplot(data=dfdiet,aes(x=Time,y=MeanWt, colour=Diet,fill=Diet)) + 
 geom_stream()+theme_classic()
p3

df18 <- df[which(df$Chick==18),]
df18

p + geom_line(data=df18, aes(x = Time, y = weight), size = 5)

ggplot(data=df,aes(x=Time,y=weight, colour=Chick,fill=Chick), size = 3) + 
geom_stream()+theme_classic()

ggplot(data=df,aes(x=Time,y=weight)) + 
geom_line() +
facet_grid(facet=Chick~.)+
theme_classic()

ggplot(data=df,aes(x=Time,y=weight)) + 
geom_line() +
facet_grid(facet=.~Chick)+
theme_classic()

ggplot(data=df,aes(x=Time,y=weight, fill=Chick)) + geom_line()

DecadeTemp = sqldf("select decade, avg(maxtp) meant from timedf group by decade")

ggplot(DecadeTemp, aes(x=decade, y=meant, fill = meant))+geom_bar(stat='identity')


