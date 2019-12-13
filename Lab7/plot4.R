#Plot 4
##Reading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Extracting dataset with SCCs that contain "Comb" in Level 1 and "Coal" in Level 4
l1comb<-SCC[grep("comb", SCC$SCC.Level.One, ignore.case = T), ]
l4coal<-SCC[grep("coal", SCC$SCC.Level.Four, ignore.case = T), ]
comb_coal<-merge(l1comb, l4coal)

##Extracting data from NEI that corresponds to extracted SCCs
comb_coal_data<-merge(NEI, comb_coal)

##Making dataset with sums of emissions by year
sumsbyyear<-aggregate(Emissions~year, comb_coal_data, sum)

##Making and saving plot 4
png("plot4.png", width=480, height=480)
plot(sumsbyyear, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", 
  main = "Total Emissions of PM2.5 
     from U.S. Coal Combustion-related Sources", 
  xaxt = "n")
axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
dev.off()

##Answer4. PM2.5 emissions from coal combustion-related sources in the United States from 1999 to 2008 have decreased.