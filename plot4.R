data <- read.csv("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, na.strings = "?")

data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
data1$Datetime <- as.POSIXct(paste(data1$Date, data1$Time))

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(data1, plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power kilowatts", xlab = ""))

with(data1, plot(Datetime, Voltage, type = "l", ylab = "Voltage (volt)", xlab = ""))

with(data1, {
  plot(Datetime, Sub_metering_1, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Datetime, Sub_metering_2, col = 'red')
  lines(Datetime, Sub_metering_3, col = 'blue')
  legend("topright", col = c('black', 'red', 'blue'), lty = 1, lwd = 2, bty = 'n', 
         legend = c('Sub_metering_1', 'Sub_metering_2', ' Sub_metering_3'))})\

with(data1, plot(Datetime, Global_reactive_power, type ='l', ylab = "Global Reactive Power (kilowatts)", xlab = ""))

png("plot4.png", height = 480, width = 480)
dev.off()
