library(tidyverse)
library(lubridate)
library(tibbletime)
#read data
dailycsv <- read_csv("./rawdata/daily.csv")
datesintable <- c("date", "dateChecked", "lastModified")
dailycsv$date <-  ymd(dailycsv$date)
rolling_mean <- rollify(mean, window = 14 )

dailycsv <- dailycsv %>%
  group_by(state) %>% 
  mutate (
  deathRolling = rolling_mean(deathIncrease)
)
  

  
ggplot (dailycsv, aes(x=date )) +
  geom_line(aes(y=deathIncrease), color = "red") +
  geom_line(aes(y=deathRolling), color  = "blue") +
  ggtitle("Numbers and Rolling Average")


