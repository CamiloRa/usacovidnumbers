library(tidyverse)
library(lubridate)

#read data
dailycsv <- read_csv("./rawdata/daily.csv")

datesintable <- c("date", "dateChecked", "lastModified")
dailycsv %>% 
  ymd(datesintable)