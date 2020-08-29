#Bringing Data to R
data <- read.csv("D://Online Courses/Data Science Specialization/exdata_data_household_power_consumption/household_power_consumption.txt")

#Creating my own data set by dividing variables
mydata <- read.table(file = "household_power_consumption.txt", header= TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")

#Creating the subset of the data set in order to prepare graphs
subsetData <- mydata[mydata$Date%in% c("1/2/2007","2/2/2007"),]

#Histogram
Plot1 <- as.numeric(subsetData$Global_active_power)
png("plot1.png", width= 480, height =480)
hist(Plot1, col= "red", main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab= "Frequency")
dev.off()

#Frequeny Plot
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, Plot1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#Colored Plot
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

#Grouped Plots
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
voltage <- as.numeric(subsetData$Voltage)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, Plot1, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()