# Find out, which __year__ was the __most terrific__ for portfolio you have identified as __most profitable__ during the lesson and 
# show it on the chart using `ggplot2` package. Write an explanation about your findings into the code as comment.
# __Commit__ it to your repository into `Lessons/Lesson2/Homework`.

## Code
library(dplyr)
library(ggplot2)

dt_KPI_raw <- read.csv("C:/Users/Public/GeneralInsurance_Class/data/lesson2_KPI.csv")
dt_KPI_raw <- dt_KPI_raw %>% filter(!is.na(Premium))
dt_KPI_raw <- dt_KPI_raw %>% filter(!is.na(Business))
for(i in 1:length(dt_KPI_raw$Premium))
{if(dt_KPI_raw$Premium[i]<0)
{dt_KPI_raw$Premium[i]=0}
}

dt_KPI_raw %>%
  group_by(Year) %>% 
  summarize(UWR= sum(Premium * (1 - (Losses + Expenses) / Premium), na.rm = TRUE)) %>% 
  arrange(UWR)

#najhorsi rok: 2015

dt_KPI_raw %>% 
  group_by(Year) %>% 
  summarize(UWR = sum(Premium * (1 - (Losses + Expenses) / Premium), na.rm = TRUE)) %>% 
  ggplot(aes(x = reorder(Year, UWR), y = UWR)) + 
  geom_col()

#Pracovala som s očistenými dátami, ktoré som zoskupila podľa rokov a porovnávala ich
#na základe Underwriting result. Najmenšia hodnota UWR vyšla pre rok 2015, teda ten
#považujem za najhorší. 

