#5 Exercise
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