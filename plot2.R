#Read relevant data from the text file 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?" )

# subsetting relevant data
data <- subset(data, data$Date == "1/2/2007" | data$Date== "2/2/2007")

#changing the class of date to Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type ="l", lwd=1, ylab=  "Global Active Power (kilowatts)", xlab = "" ) 

dev.off()
