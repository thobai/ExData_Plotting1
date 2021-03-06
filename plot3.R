
Sys.setlocale("LC_TIME", "C") # setting localization to get English names for days in plot

setwd("~/Documents/Learning/GitHub/ExData_Plotting1/")
data = read.csv("household_power_consumption.txt",,sep=c(";"))  # read csv file 

data2 <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
data2$timestamp <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))


png("plot3.png", width = 480, height = 480, bg = "transparent")
with(data2, plot(timestamp, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main="", type="n"))
with(data2, lines(timestamp, Sub_metering_1))
with(data2, lines(timestamp, Sub_metering_2, col = "red"))
with(data2, lines(timestamp, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
