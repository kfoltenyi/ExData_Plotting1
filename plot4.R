#read in data file
alldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert Date column
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

#subset data to days of interest
days <- alldata[(alldata$Date=="2007-02-01") | (alldata$Date=="2007-02-02"),]

#add column with Date and Time in POSIXlt and POSIxt format
days$timestamp <- strptime(paste(days$Date, days$Time), "%Y-%m-%d %H:%M:%S")

#open file device, make plot and close device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(days$timestamp, days$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(days$timestamp, days$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(days$timestamp, days$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(days$timestamp, days$Sub_metering_2, type="l", col="red")
lines(days$timestamp, days$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="n")

plot(days$timestamp, days$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
