
header = TRUE,
sep = ";",
na.strings = "?")

Date1 <- Energy_use[Energy_use$Date == "1/2/2007",]
Date2 <- Energy_use[Energy_use$Date == "2/2/2007",]
Energy_rates <- rbind(Date1, Date2)
Energy_rates$datetime <- paste(Energy_rates$Date, Energy_rates$Time, sep = ' ')
Energy_rates$datetime <- strptime(Energy_rates$datetime, "%d/%m/%Y %H:%M:%S")
Energy_rates <- Energy_rates[, c(10, 3:9)]

png(file = "Plot2.png", width = 480, height = 480)
plot(Energy_rates$datetime, Energy_rates$Global_active_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
dev.off()