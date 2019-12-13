#Plot 3
##Reading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Making dataset with sums of emissions by year
sumsbyfipstypeyear<-aggregate(Emissions~fips+type+year, NEI, sum)

##Extractind dataset of Baltimore
Baltimore<-subset(sumsbyfipstypeyear, fips=="24510")

##Making and saving plot 3
library(ggplot2)
png("plot3.png", width=480, height=480)
qplot(x=year, y=Emissions, data=Baltimore, facets=.~type, geom = c("point", "line"), xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 by the Type of Source in Baltimore, Maryland", color=type)
dev.off()

##Answer3. In Baltimore, in 1999–2008, there were decreases in the following types of sources: non-road, non-point and onroad. During the same period, emission increases were observed from point type.