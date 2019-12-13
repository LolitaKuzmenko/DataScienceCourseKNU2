#Plot 5
##Reading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Extracting dataset with SCCs that contain "Vehicle" in Level 3
mv<-SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]

##Extracting data from NEI that corresponds to extracted SCCs
mv_data<-merge(NEI, mv, by="SCC")

##Extractind dataset of Baltimore
Baltimore<-subset(mv_data, fips=="24510")

##Making dataset with sums of emissions by year
sumsbyyear_B<-aggregate(Emissions~year, Baltimore, sum)

##Making and saving plot 5
png("plot5.png", width=480, height=480)
plot(sumsbyyear_B, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", 
     main = "Total Emissions of PM2.5 
     from Motor Vehicle Sources in Baltimore, Maryland", 
     xaxt = "n")
axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
dev.off()

##Answer 5. PM2.5 emissions from motor vehicle sources in Baltimore from 1999 to 2008 have decreased.