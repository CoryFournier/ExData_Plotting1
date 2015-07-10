Energy_use <- read.table("household_power_consumption.txt", 
                         header = TRUE,
                         sep = ";",
                         na.strings = "?")

Date1 <- Energy_use[Energy_use$Date == "1/2/2007",]
Date2 <- Energy_use[Energy_use$Date == "2/2/2007",]
Energy_rates <- rbind(Date1, Date2)
Energy_rates$datetime <- paste(Energy_rates$Date, Energy_rates$Time, sep = ' ')
Energy_rates$datetime <- strptime(Energy_rates$datetime, "%d/%m/%Y %H:%M:%S")
Energy_rates <- Energy_rates[, c(10, 3:9)]

png(file = "Plot1.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(Energy_rates$datetime, Energy_rates$Global_active_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
plot(Energy_rates$datetime, Energy_rates$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(Energy_rates$datetime, Energy_rates$Sub_metering_1, type = "l", xlab = "datetime", ylab = "Energy sub metering")
lines(Energy_rates$datetime, Energy_rates$Sub_metering_2, col = "red")
lines(Energy_rates$datetime, Energy_rates$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "blue", "red"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
plot(Energy_rates$datetime, Energy_rates$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()