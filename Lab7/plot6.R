#Plot 6
##Reading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

##Extracting dataset with SCCs that contain "Vehicle" in Level 3
mv<-SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]

##Extracting data from NEI that corresponds to extracted SCCs
mv_data<-merge(NEI, mv, by="SCC")

##Extractind dataset of Baltimore and Los Angeles
B_LA<-subset(mv_data, fips=="24510" | fips=="06037")

##Making dataset with sums of emissions by year
sumsbyyear_B_LA<-aggregate(Emissions~fips+year, B_LA, sum)

##Making and saving plot 6
png("plot6.png", width=480, height=480)
ggplot(sumsbyyear_B_LA, aes(year, Emissions))+
  geom_line(aes(color=fips))+
  geom_point(aes(color=fips))+
  labs(title = "Total Emissions of PM2.5 from Motor Vehicle Sources 
in Baltimore, Maryland and Los Angeles, California")+
  labs(x = "Year", y = "Emissions of PM2.5 (tons)")+
  scale_color_discrete(name = "Fips", labels = c("Los Angeles", "Baltimore"))
dev.off()

##Answer 6. PM2.5 emissions from automotive sources in Baltimore from 1999 to 2008 have decreased significantly. In the period from 1999 to 2005 in Los Angeles, PM2.5 emissions from automobile sources increased significantly, but in 2008 decreased to 1999 levels.