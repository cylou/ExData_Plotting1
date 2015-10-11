plot2 <- function() {
	library(data.table)
	Sys.setlocale("LC_TIME", "English") #just to have the day in English

	data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

	data$timetemp <- paste(data$Date, data$Time)
	my_data <- as.data.frame(data)
	my_data$Time <- strptime(my_data$timetemp, format = "%d/%m/%Y %H:%M:%S")

	my_data <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")
	
	plot(x = my_data$Time, y = my_data$Global_active_power, type = "n", ylab = "Global Active Power (kilowattts)")

	lines(x = my_data$Time, y = my_data$Global_active_power)
	
	dev.copy(png, file = "plot2.png")
	dev.off()

}