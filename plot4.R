#Read relevant data from the text file 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?" )

# subsetting relevant data
data <- subset(data, data$Date == "1/2/2007" | data$Date== "2/2/2007")

#changing the class of date to Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#set the canvas
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#plot 1
plot(data$DateTime, data$Global_active_power, type ="l", lwd=1, ylab=  "Global Active Power (kilowatts)", xlab = "" )

#plot 2
plot(data$DateTime, data$Voltage, type ="l", ylab=  "Voltage", xlab = "datetime" )

#plot 3
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


#plot 4
plot(data$DateTime, data$Global_reactive_power, type ="l", ylab=  "Global_reactive_power", xlab = "datetime" )

dev.off()
