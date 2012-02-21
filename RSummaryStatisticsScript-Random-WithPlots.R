sink("SummaryStatistics.txt")

name <- "Chicago-9blkSquare-968Person-60Perc-45MRad"
print("Chicago-9blkSquare-968Person-60Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-60Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")


name <- "Chicago-9blkSquare-968Person-100Perc-45MRad"
print("Chicago-9blkSquare-968Person-100Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-100Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-10Perc-45MRad"
print("Chicago-9blkSquare-968Person-10Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-10Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-1Perc-45MRad"
print("Chicago-9blkSquare-968Person-1Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-1Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-20Perc-45MRad"
print("Chicago-9blkSquare-968Person-20Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-20Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-30Perc-45MRad"
print("Chicago-9blkSquare-968Person-30Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-30Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-50Perc-45MRad"
print("Chicago-9blkSquare-968Person-50Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-50Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-5Perc-45MRad"
print("Chicago-9blkSquare-968Person-5Perc-45MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-5Perc-45MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-100Perc-15MRad"
print("Chicago-9blkSquare-968Person-100Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-100Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-10Perc-15MRad"
print("Chicago-9blkSquare-968Person-10Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-10Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-1Perc-15MRad"
print("Chicago-9blkSquare-968Person-1Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-1Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-20Perc-15MRad"
print("Chicago-9blkSquare-968Person-20Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-20Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-30Perc-15MRad"
print("Chicago-9blkSquare-968Person-30Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-30Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-50Perc-15MRad"
print("Chicago-9blkSquare-968Person-50Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-50Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-5Perc-15MRad"
print("Chicago-9blkSquare-968Person-5Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-5Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-60Perc-15MRad"
print("Chicago-9blkSquare-968Person-60Perc-15MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-60Perc-15MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-100Perc-30MRad"
print("Chicago-9blkSquare-968Person-100Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-100Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-10Perc-30MRad"
print("Chicago-9blkSquare-968Person-10Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-10Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-20Perc-30MRad"
print("Chicago-9blkSquare-968Person-20Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-20Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-50Perc-30MRad"
print("Chicago-9blkSquare-968Person-50Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-50Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-30Perc-30MRad"
print("Chicago-9blkSquare-968Person-30Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-30Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-5Perc-30MRad"
print("Chicago-9blkSquare-968Person-5Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-5Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-1Perc-30MRad"
print("Chicago-9blkSquare-968Person-1Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-1Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")

name <- "Chicago-9blkSquare-968Person-60Perc-30MRad"
print("Chicago-9blkSquare-968Person-60Perc-30MRad")
experiment1 <- read.table("/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-9blkSquare-968Person-60Perc-30MRad/Experiment1-statdata.out-cell", header=T)
summary(experiment1)
sd(experiment1)
hist(experiment1$percent.steps.detected.inner, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-innerstepsdetected",sep=""), type="jpeg")
hist(experiment1$percent.steps.detected.outer, main=name, xlim=c(0,1))
#savePlot(filename=paste(name,"-outerstepsdetected",sep=""), type="jpeg")
