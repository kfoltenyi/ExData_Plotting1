#read in data file
alldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert Date column
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

#subset data to days of interest
days <- alldata[(alldata$Date=="2007-02-01") | (alldata$Date=="2007-02-02"),]

#add column with Date and Time in POSIXlt and POSIxt format
days$timestamp <- strptime(paste(days$Date, days$Time), "%Y-%m-%d %H:%M:%S")

#open file device, make plot and close device
png("plot1.png", width=480, height=480)
hist(days$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.off()