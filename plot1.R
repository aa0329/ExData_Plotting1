my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data$Time <- times(my_data$Time)
my_data <- subset(my_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# 
plot1 <- hist(my_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, "plot1.png")
dev.off()
