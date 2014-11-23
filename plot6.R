library(data.table)
library(ggplot2)
library(grid)
library(gridExtra)

NEI<-readRDS("summarySCC_PM25.rds")

SCC<-readRDS("Source_Classification_Code.rds")

frame<- subset(NEI, fips == "24510")

x<-grep("On-Road", SCC$EI.Sector)

dt<- SCC[x,]

data <- as.data.table(merge(frame, dt, by = 'SCC'))

nine<- subset(data, year == "1999")
em_99<- sum(nine$Emissions)


two<- subset(data, year == "2002")
em_02<- sum(two$Emissions)


five<- subset(data, year == "2005")
em_05<- sum(five$Emissions)


eight<- subset(data, year == "2008")
em_08<- sum(eight$Emissions)

emissions<- c(em_99, em_02, em_05, em_08)

time<- unique(data$year)



p1<- qplot(time, emissions, xlab = "Year", ylab = "PM2.5 Emissions (tonnes)", main = "Motor vehicle emissions in Baltimore") +
  theme(plot.title = element_text(size = rel(0.7)))
###############################################################

fram<- subset(NEI, fips == "06037")

dat <- as.data.table(merge(fram, dt, by = 'SCC'))

nin<- subset(dat, year == "1999")
em_9<- sum(nin$Emissions)


twoo<- subset(dat, year == "2002")
em_2<- sum(two0$Emissions)


fiv<- subset(dat, year == "2005")
em_5<- sum(fiv$Emissions)


eigh<- subset(data, year == "2008")
em_8<- sum(eigh$Emissions)

emission<- c(em_9, em_2, em_5, em_8)


p2<- qplot(time, emission, xlab = "Year", ylab = "PM2.5 Emissions (tonnes)", main = "Motor vehicle emissions in Los Angeles County") +
  theme(plot.title = element_text(size = rel(0.7)))


png('plot6.png')

grid.arrange(p1,p2, ncol = 2)

dev.off()