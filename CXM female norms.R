CXM <- read.csv("CXM normal data.csv", header=TRUE, sep=",")
require(gamlss)
library(gamlss)
# female <- subset(CXM, Sex == 'F', select=c("STUDY", "ID", "Sex", "Race", "Age", "Ht", "HtV", "Ht.z", "Wt.z", "BMI.z", "Genit.Tanner.Stage", "CXM"))
# male <- subset(CXM, Sex == 'M', select=c("STUDY", "ID", "Sex", "Race", "Age", "Ht", "HtV", "Ht.z", "Wt.z", "BMI.z", "Genit.Tanner.Stage", "CXM"))
# data(CXM)
male <- subset(CXM, Sex == 'M', select=c("STUDY", "ID", "Sex", "Race", "Age", "Ht", "HtV", "Ht.z", "Wt.z", "BMI.z", "Genit.Tanner.Stage", "CXM"))
#data(female)
x<- male$Age
y<- male$CXM
#data=na.omit(female))
h<-gamlss(y~pb(x), sigma.fo=~pb(x), family=BCT, data=na.omit(male)) 
# default plot
centiles(h,xvar=male$Age)
# control of colours and lines
centiles(h, xvar=male$Age,  col.cent=c(2,3,4,5,1,5,4,3,2,1), 
         lwd.cent=c(1,1,1,1,2,1,1,1,1))
#Control line types
centiles(h, xvar=male$Age,  col.cent=1, cent=c(3,10,25,50,75,90,97), 
         lty.centiles=c(4,3,2,1,2,3,4),lwd.cent=c(1,1,1,2,1,1,1))
# control of the main title
centiles(h, xvar=male$Age,  main="Female CXM norms")
# the fan-chart
centiles.fan(h,xvar=male$Age, colors="rainbow")
rm(h)
