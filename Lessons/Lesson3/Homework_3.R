## Exercise 4
# Use the data provided in exercise 2 and try to come up with an estimates of the average duration. 
# How does it work? Well, discounting apart, in what year does the average payment happen? 
# HINT: (Here you definitely use paid claims, and it is enough to calculate weighted average of incremental payment)

library(dplyr)
library(ggplot2)
library(ChainLadder)

dt_PaidCase <- read.csv("data/lesson3_PaidCase.csv")

Paid_HH_sml <- dt_PaidCase %>% 
  filter(Business == "House" & ClaimSize == "Small" & dataset_type == "PAID")  %>% 
  as.triangle(origin="ay", dev="dy", value="SumOfamount")

## STEP1: get the weights of incremental paid triangle => this is what we are intrested in because individual payments matter

Paid_HH_sml_Incremental<-cum2incr(Paid_HH_sml)
weights<-attr(ata(Paid_HH_sml_Incremental),"vwtd")
weights

## STEP2: average duration (calculate a weighted sum, where the weight is the number of year/total cummulative paid sum)

average_duration<-sum(weights*c(1:9)/sum(weights))
average_duration
