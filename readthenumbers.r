library(tidyverse)
library(lubridate)

#read data
dailycsv <- read_csv("./rawdata/daily.csv")

datesintable <- c("date", "dateChecked", "lastModified")

dailycsv$date <-  ymd(dailycsv$date)

ggplot (dailycsv, aes(x=date, y=deathIncrease)) +
  geom_line()

