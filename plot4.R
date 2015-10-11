plot4 <- function() {
	library(data.table)
	Sys.setlocale("LC_TIME", "English") #just to have the day in English

	data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

	data$timetemp <- paste(data$Date, data$Time)
	my_data_temp <- as.data.frame(data)
	my_data_temp$Time <- strptime(my_data_temp$timetemp, format = "%d/%m/%Y %H:%M:%S")

	my_data <- subset(my_data_temp, Date == "1/2/2007" | Date == "2/2/2007")
	
	par(mfrow=c(2,2), mar = c(4,4,2,2))

#1st graph
	with(my_data, plot(x=Time, y=Global_active_power, type="n", ylab="Global Active Power", xlab=""))
	with(my_data, lines(x=Time, y=Global_active_power))


#2nd graph
	with(my_data, plot(x=Time, y=Voltage, type="n", xlab="datetime"))
	with(my_data, lines(x=Time, y=Voltage))


#3rd graph
	with(my_data, plot(x = Time, y = Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab=""))
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", col=c("black", "red", "blue"))

	with(my_data, lines(x = Time, y = Sub_metering_1))
	with(my_data, lines(x = Time, y = Sub_metering_2, col = "red"))
	with(my_data, lines(x = Time, y = Sub_metering_3, col = "blue"))


#4th graph
	with(my_data, plot(x=Time, y=Global_reactive_power, type="n", xlab="datetime"))
	with(my_data, lines(x=Time, y=Global_reactive_power))


	dev.copy(png, file = "plot4.png")
	dev.off()

}