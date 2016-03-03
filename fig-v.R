#5 Exercise
libs <- c('ggplot2', 'latticeExtra', 'gridExtra', 'MASS', 
          'colorspace', 'plyr', 'Hmisc', 'scales')
lapply(libs, require, character.only = T)

data(diamonds)
#1 Exercise
diamonds.ideal<- subset(diamonds, diamonds$cut=="Ideal")
diamonds.rest.nonJ<-subset(diamonds, diamonds$cut != "Ideal" & diamonds$color != "J")

#2 Exercise
diamonds.ideal.carat.mean<- aggregate(diamonds.ideal$carat, by = list(diamonds.ideal$clarity), FUN=mean)
diamonds.ideal.carat.median<- aggregate(diamonds.ideal$carat, by = list(diamonds.ideal$clarity), FUN=median)

#3 Exercise
names(diamonds.ideal.carat.mean) <- c("Clarity", "MeanIncarat")
diamonds.order<- diamonds.ideal.carat.mean[order(diamonds.ideal.carat.mean$MeanIncarat),]

#4 Exercise
names(diamonds.ideal.carat.median)<-c("Clarity", "MedianIncarat")
diamonds.mean.median<-merge(diamonds.ideal.carat.mean, diamonds.ideal.carat.median, by="Clarity")


setwd("./")
pdf("fig-v.pdf")
xyplot(diamonds.mean.median$MeanIncarat ~ diamonds.mean.median$MedianIncarat, data=diamonds.mean.median,
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         panel.smoother(x, y, 
                        col = "red", 
                        col.se = "black",
                        alpha.se = 0.3)
         
       })

ggplot(diamonds.mean.median,aes(diamonds.mean.median$MedianIncarat, diamonds.mean.median$MeanIncarat)) + geom_point()+stat_smooth()
x<- dev.off()
