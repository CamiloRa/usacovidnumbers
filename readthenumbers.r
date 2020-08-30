
# install libraries -------------------------------------------------------

library(tidyverse)
library(lubridate)
library(tibbletime)
library(cowplot)
# read data ---------------------------------------------------------------

dailycsv <- read_csv("./rawdata/daily.csv")
datesintable <- c("date", "dateChecked", "lastModified")
dailycsv$date <-  ymd(dailycsv$date)
#dailycsv$state <-  as.factor(dailycsv$state)
rolling_mean14 <- rollify(mean, window = 14 )
rolling_mean07 <- rollify(mean, window = 7 )
rolling_mean03 <- rollify(mean, window = 3 )

daily_rolling <- dailycsv %>% select("date",  "death", "positive", "deathIncrease")

daily_rolling2 <- daily_rolling %>%
  mutate (
  deathRolling = rolling_mean(deathIncrease)
)


# plots -------------------------------------------------------------------

plot1 <- ggplot (daily_rolling2, aes(x=date, y= deathIncrease)) +
  geom_line(color = "red") +
  ggtitle("Numbers and Rolling Average")

plot1
