#This program will download data from crime data, and convert it into a data fram
fileURL <- "https://data.baltimorecity.gov/api/views/wsfq-mvij/rows.csv?accessType=DOWNLOAD&bom=true"
download.file(fileURL,destfile = "crime.csv",method = "auto")
list.files(".")
# The csv contains both NULL values and privacysuppressed designations in numeric fields
crimedata <- read.csv("crime.csv")
CD <- tbl_df(crimedata) 
dim(CD)
library(dplyr)
summarise(CD,Avg=mean(Post,na.rm=T))
summarise(CD,Avg=mean(Total.Incidents,na.rm=T))
summarise(CD,stand=sd(Post,na.rm=T))
summarise(CD,stand=sd(Total.Incidents,na.rm=T))
by_CrimeCode<- group_by(CD,CrimeCode)
cride <- summarise(by_CrimeCode,aveg = mean(CrimeCode,na.rm=T),
                  MSAT = mean(SATVR25,na.rm=T))