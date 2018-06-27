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

#prepare the plot's data and aes layers:
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p

#add geometries
q <- p + geom_jitter(aes(size=Budget...mill., color=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.color=NA)
q

#non-data ink
q <- q + xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
q

#theme
q <- q + 
  theme(
    axis.title.x = element_text(color="Blue", size=30),
    axis.title.y = element_text(color="Blue", size=30),
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    
    plot.title = element_text(size=40),
    
    legend.title = element_text(size=20),
    legend.text = element_text(size=20)
    
  )

q

# Final touch
q$labels$size <- "Budget $M"











