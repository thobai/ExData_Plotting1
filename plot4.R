
Sys.setlocale("LC_TIME", "C") # setting localization to get English names for days in plot

setwd("~/Documents/Learning/GitHub/ExData_Plotting1/")
data = read.csv("household_power_consumption.txt",,sep=c(";"))  # read csv file 

data2 <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
data2$datetime <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

data2$Voltage <- as.numeric(as.character(data2$Voltage))

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))

png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))

# upper left figure
with(data2, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", main="", type="n"))
with(data2, lines(datetime, Global_active_power))

# upper right figure
with(data2, plot(datetime, Voltage, ylab = "Voltage", main="", type="n"))
with(data2, lines(datetime, Voltage))

# lower left figure
with(data2, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main="", type="n"))
with(data2, lines(datetime, Sub_metering_1))
with(data2, lines(datetime, Sub_metering_2, col = "red"))
with(data2, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n" )


# lower right figure
with(data2, plot(datetime, Global_reactive_power, main="", type="n"))
with(data2, lines(datetime, Global_reactive_power))

dev.off()
