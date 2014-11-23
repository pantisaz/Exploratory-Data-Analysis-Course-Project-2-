library(ggplot2)
library(grid)
library(gridExtra)

data <- readRDS("summarySCC_PM25.rds")

subdata<- subset(data, fips == "24510")

emissions<-data.frame(matrix(nrow = 4, ncol = 4))

types<- unique(subdata$type)

for (i in 1:4) 
{
  
  sub<- subset(subdata, type == types[i])

  nine<- subset(sub, year == "1999")
  em_99<- sum(nine$Emissions)


  two<- subset(sub, year == "2002")
  em_02<- sum(two$Emissions)


  five<- subset(sub, year == "2005")
  em_05<- sum(five$Emissions)


  eight<- subset(sub, year == "2008")
  em_08<- sum(eight$Emissions)

emissions[,i] <- c(em_99, em_02, em_05, em_08)

}

png('plot3.png')

p1<- qplot(unique(data$year), emissions[,1], xlab="Year", ylab="PM2.5 Emissions (tonnes)", main=types[1]) 

p2<- qplot(unique(data$year), emissions[,2], xlab="Year", ylab="PM2.5 Emissions (tonnes)", main=types[2])

p3<- qplot(unique(data$year), emissions[,3], xlab="Year", ylab="PM2.5 Emissions (tonnes)", main=types[3])

p4<- qplot(unique(data$year), emissions[,4], xlab="Year", ylab="PM2.5 Emissions (tonnes)", main=types[4])

grid.arrange(p1, p2, p3, p4, ncol = 2)

dev.off()

