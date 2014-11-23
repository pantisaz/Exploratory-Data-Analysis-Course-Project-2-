library(data.table)
library(ggplot2)
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

png('plot5.png')

qplot(time, emissions, xlab = "Year", ylab = "PM2.5 Emissions", main = "Motor vehicle emissions in Baltimore City")

dev.off()