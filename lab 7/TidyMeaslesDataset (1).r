library(tidyverse)
library(reshape2)
library(plotly)
library(ggplot2)
library(tidyverse)#  This library includes ggplot and a few others.
library(sqldf)
library(ggstream)
df<-read.csv('./lab8/US.14189004.csv')

datasetname = "https://cli.fusio.net/cli/climate_data/webdata/dly532.csv"
colnames(df)

dfdub<-read.csv(datasetname,skip=25)

str(dfdub)

unique(df$ConditionSNOMED)
unique(df$ConditionName)
unique(df$PathogenName)
unique(df$PathogenTaxonID)
unique(df$CountryName)
unique(df$CountryISO)
unique(df$Admin1Name)

length(unique(df$Admin1Name))
length(unique(df$Admin1ISO))
length(unique(df$Admin2Name))
length(unique(df$CityName))
length(unique(df$PeriodStartDate))
length(unique(df$PeriodEndDate))
length(unique(df$PartOfCumulativeCountSeries))
length(unique(df$AgeRange))
length(unique(df$Subpopulation))

unique(df$AgeRange)
unique(df$Subpopulation)
unique(df$PartOfCumulativeCountSeries)

length(unique(df$PlaceOfAcquisition))
length(unique(df$DiagnosisCertainty))
length(unique(df$SourceName))
length(unique(df$CountValue))

unique(df$PlaceOfAcquisition)
unique(df$DiagnosisCertainty)
unique(df$SourceName)

USMeasles<-df%>%
select('Admin1Name','Admin1ISO','Admin2Name','CityName','PeriodStartDate','PeriodEndDate',
       'PlaceOfAcquisition','CountValue')

pathname = './lab8/USMeasles.csv'
write_csv(USMeasles, pathname)

str(USMeasles)

USMeasles %>%

  group_by(PlaceOfAcquisition) %>%
  summarise(NumberOfCases = sum(CountValue))

colnames(USMeasles)

Travdf <- 
    USMeasles %>%
    filter(PlaceOfAcquisition=='Abroad') %>%
    select(-'PlaceOfAcquisition')

str(Travdf)

length(unique(Travdf$Admin1Name))
length(unique(USMeasles$Admin1Name))
#note %y gives 2-digit year

USMeasles$Year= substring(USMeasles$PeriodStartDate, 1, 4 )
USMeasles$Year = as.integer(USMeasles$Year)

timedf<-sqldf("select Year, Admin1Name, CountValue, PlaceOfAcquisition from USMeasles")
str(timedf)
timdedf = sqldf("Select * from USMeasles WHERE Year>='1950' AND WHERE Year<= '1980 ")
timedf['decade']=timedf$Year-timedf$Year%%10

timed<-sqldf("select date, maxtp, mintp, rain, ddhm, sun from dfdub")
str(timed)

ggplot(USMeasles, aes(x = Year, y = Admin1Name, fill = CountValue)) +
  scale_fill_distiller(palette = "YlOrBr") +
  # scale_fill_distiller(palette = "Viridis") +
  geom_tile()
 
ggplot(timedf, aes(x=decade, y=CountValue))+geom_bar(stat='identity')

