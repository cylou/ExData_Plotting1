plot1 <- function() {
	library(data.table)

	data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

	my_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
	
	hist(my_data$Global_active_power, col = "red", xlab = "Global Acctive Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

	dev.copy(png, file = "plot1.png")
	dev.off()

}