#Read relevant data from the text file 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?" )

# subsetting relevant data
data <- subset(data, data$Date == "1/2/2007" | data$Date== "2/2/2007")


#build plot-1 (histogram)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()



