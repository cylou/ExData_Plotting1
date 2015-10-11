plot3 <- function() {
	library(data.table)
	Sys.setlocale("LC_TIME", "English") #just to have the day in English

	data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

	data$timetemp <- paste(data$Date, data$Time)
	my_data <- as.data.frame(data)
	my_data$Time <- strptime(my_data$timetemp, format = "%d/%m/%Y %H:%M:%S")

	my_data <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")
	
	with(my_data, plot(x = Time, y = Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab=""))
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", col=c("black", "red", "blue"))

	with(my_data, lines(x = Time, y = Sub_metering_1))
	with(my_data, lines(x = Time, y = Sub_metering_2, col = "red"))
	with(my_data, lines(x = Time, y = Sub_metering_3, col = "blue"))

	dev.copy(png, file = "plot3.png")
	dev.off()

}