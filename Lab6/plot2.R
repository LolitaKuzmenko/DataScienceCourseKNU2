#Plot 2
##Reading data
data<-read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

##Extracting data from 1/2/2007 and 2/2/2007
my_dates<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##Converting variables "Time" and "Date" from String to Date/Time class 
my_dates$DateTime<-paste(my_dates$Date, my_dates$Time)
my_dates$DateTime<-strptime(my_dates$DateTime, "%d/%m/%Y %H:%M:%S")
my_dates$Date<-as.Date(my_dates$Date, "%d/%m/%Y")

##Making and saving plot 2
png("plot2.png", width=480, height=480)
plot(my_dates$DateTime, my_dates$Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power (kilowatts)")
dev.off()