my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data$Time <- times(my_data$Time)
my_data <- subset(my_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(2.5,5,1,1), oma=c(0,0,2,0))
plot(my_data$Global_active_power ~ my_data$datetime, type = "l", xlab = "", ylab = "Global Active Power")
plot(my_data$Voltage ~ my_data$datetime, type = "l", xlab = "datetime", ylab = "Voltage")
plot(my_data$Sub_metering_1 ~ my_data$datetime, type = "n", xlab = "", ylab = "Energy sub metering")
points(my_data$Sub_metering_1 ~ my_data$datetime, col = "black", type = "l")
points(my_data$Sub_metering_2 ~ my_data$datetime, col = "red", type = "l")
points(my_data$Sub_metering_3 ~ my_data$datetime, col = "blue", type = "l")
plot(my_data$Global_reactive_power ~ my_data$datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "plot4.png")
dev.off()




