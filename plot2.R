my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data$Time <- times(my_data$Time)
my_data <- subset(my_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# 
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$datetime <- as.POSIXct(datetime)
plot(my_data$Global_active_power ~ my_data$datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()