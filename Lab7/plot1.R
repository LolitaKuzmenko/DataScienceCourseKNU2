#Plot 1
##Reading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Making dataset with sums of emissions by year
sumsbyyear<-aggregate(Emissions~year, NEI, sum)

#Turn Off scientific notation
format(sumsbyyear$Emissions,scientific=FALSE)

##Making and saving plot 1
png("plot1.png", width=480, height=480)
plot(sumsbyyear, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from all U.S. Sources", xaxt = "n")
axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
dev.off()

##Answer1. Yes, total PM2.5 emissions in the United States from 1999 to 2008 have decreased.
