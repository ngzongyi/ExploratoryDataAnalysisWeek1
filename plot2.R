data <- read.csv("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
paste(data1$Date, data1$Time)

data1$Datetime <- as.POSIXct(paste(data1$Date, data1$Time))

with(data1, plot(Global_active_power~Datetime))

with(data1, plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power kilowatts", xlab = ""))

png("plot2.png", width=480, height=480)
dev.off()

