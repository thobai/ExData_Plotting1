
Sys.setlocale("LC_TIME", "C") # setting localization to get English names for days in plot

setwd("~/Documents/Learning/GitHub/ExData_Plotting1/")
data = read.csv("household_power_consumption.txt",,sep=c(";"))  # read csv file 

data2 <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
data2$timestamp <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

png("plot2.png", width = 480, height = 480, bg = "transparent")
with(data2, plot(timestamp, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main="", type="n"))
with(data2, lines(timestamp, Global_active_power))
dev.off()
