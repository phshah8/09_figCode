libs <- c('ggplot2', 'latticeExtra', 'gridExtra', 'MASS', 
          'colorspace', 'plyr', 'Hmisc', 'scales')
lapply(libs, require, character.only = T)

data(diamonds)

#1 Exercise
diamonds.ideal<- subset(diamonds, diamonds$cut=="Ideal")
diamonds.rest.nonJ<-subset(diamonds, diamonds$cut != "Ideal" & diamonds$color != "J")


#6 Exercise
setwd("./")
pdf("fig-vi.pdf")
hist.lattice<-histogram(~price|cut+color, data=diamonds.rest.nonJ)
hist.gg<-ggplot(diamonds.rest.nonJ,aes(x=price)) + geom_histogram(aes(y=..ncount..))+facet_grid(cut~color)
grid.arrange(hist.lattice, hist.gg, ncol=2)
x<-dev.off()
