data <- read.csv("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, na.strings = "?")

data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

data1$Datetime <- as.POSIXct(paste(data1$Date, data1$Time))

with(data1, plot(Datetime, Sub_metering_1, type = "l"))
with(data1, lines(Datetime, Sub_metering_2, col = 'red'))
with(data1, lines(Datetime, Sub_metering_3, col = 'blue'))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


png("plot3.png", height = 480, width = 480)
dev.off()
