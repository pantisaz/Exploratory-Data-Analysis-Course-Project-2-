data <- readRDS("summarySCC_PM25.rds")

subdata<- subset(data, fips == "24510")

nine<- subset(subdata, year == "1999")
em_99<- sum(nine$Emissions)


two<- subset(subdata, year == "2002")
em_02<- sum(two$Emissions)


five<- subset(subdata, year == "2005")
em_05<- sum(five$Emissions)


eight<- subset(subdata, year == "2008")
em_08<- sum(eight$Emissions)

emissions<- c(em_99, em_02, em_05, em_08)

time<- unique(data$year)

png('plot2.png')

plot(time, emissions, xlab = "Year", ylab = "PM2.5 Emissions (tonnes)", main = "Total PM2.5 Emissions in Baltimore City")

dev.off()