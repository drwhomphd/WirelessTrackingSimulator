sink("SummaryStatistics.txt")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-45MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-45MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-15MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-15MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-100Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-10Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-20Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-50Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-30Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-5Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-1Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-30MRad"
print("Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-2000Peds-750Cars-1700to1730-Trial1-60Perc-30MRad/udel-statdata.out-router", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")
