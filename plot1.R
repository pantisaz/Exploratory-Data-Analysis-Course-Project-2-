data <- readRDS("summarySCC_PM25.rds")

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

png('plot1.png')

plot(time, emissions, xlab = "Year", ylab = "PM2.5 Emissions (tonnes)", main = "Total PM2.5 Emissons in the United States")

dev.off()