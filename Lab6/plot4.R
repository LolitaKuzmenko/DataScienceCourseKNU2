#Plot 4
##Reading data
data<-read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

##Extracting data from 1/2/2007 and 2/2/2007
my_dates<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##Converting variables "Time" and "Date" from String to Date/Time class 
my_dates$DateTime<-paste(my_dates$Date, my_dates$Time)
my_dates$DateTime<-strptime(my_dates$DateTime, "%d/%m/%Y %H:%M:%S")
my_dates$Date<-as.Date(my_dates$Date, "%d/%m/%Y")

##Making and saving plot 4
png("plot4.png", width=480, height=480)

###Make multiple plots
par(mfrow = c(2, 2))

###Global Active Power plot
plot(my_dates$DateTime, my_dates$Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power")

###Voltage plot
plot(my_dates$DateTime, my_dates$Voltage, type = "l", xlab = "datetime",  ylab = "Voltage")

###Energy sub metering plot
plot(my_dates$DateTime, my_dates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(my_dates$DateTime, my_dates$Sub_metering_2, type = "l", col = "red")
lines(my_dates$DateTime, my_dates$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), bty = "n")

###Global Reactive Power plot
plot(my_dates$DateTime, my_dates$Global_reactive_power, type = "l", xlab = "datetime",  ylab = "Global_reactive_power")

dev.off()
