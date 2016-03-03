#6 Exercise
setwd("./")
pdf("fig-vi.pdf")
histogram(~price|cut+color, data=diamonds.rest.nonJ)
ggplot(diamonds.rest.nonJ,aes(x=price)) + geom_histogram(aes(y=..ncount..))+facet_grid(cut~color)
x<-dev.off()