library(tidyverse)
library(lubridate)
library(tibbletime)
#read data
dailycsv <- read_csv("./rawdata/daily.csv")
datesintable <- c("date", "dateChecked", "lastModified")
dailycsv$date <-  ymd(dailycsv$date)
rolling_mean <- rollify(mean, window = 14 )

daily_rolling <- dailycsv %>%
  mutate (
  deathRolling = rolling_mean(deathIncrease)
)


ggplot (daily_rolling, aes(x=date )) +
  geom_line(aes(y=deathIncrease), color = "red") +
  ggtitle("Numbers and Rolling Average")

ggplot (totalUSA, aes(x=date, y=deathIncrease)) +
  geom_line(color = "red") +
  ggtitle("Numbers and Rolling Average")

