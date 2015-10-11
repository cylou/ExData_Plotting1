exo <- function() {
	library(data.table)
	#library(dplyr)

	data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

	#data$timetemp <- paste(data$Date, data$Time)
	#my_data <- as.data.frame(data)
	#my_data$Time <- strptime(my_data$timetemp, format = "%d/%m/%Y %H:%M:%S")

	my_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
	
	hist(my_data$Global_active_power, col = "red", xlab = "Global Acctive Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

	dev.copy(png, file = "plot1.png")
	dev.off()

}