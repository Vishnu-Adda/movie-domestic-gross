#import data
getwd()
# setwd() if not in desired directory

mov <- read.csv("Section6-Homework-Data.csv")

#data exploration
head(mov)
summary(mov)
str(mov)

#activate ggplot2
install.packages("ggplot2") # conventional
library(ggplot2) # actual activation

#interesting insight: No movies released on Monday
ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

#filter #1 for the data frame
filt <- (mov$Genre == "action") | 
  (mov$Genre == "adventure") | 
  (mov$Genre == "animation") | 
  (mov$Genre == "comedy") | 
  (mov$Genre == "drama")

#filter #2
# If it matches anything in c, return T
filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures") 

filt
filt2

mov2 <- mov[filt & filt2,]
mov2





