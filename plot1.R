
setwd("~/Documents/Learning/GitHub/ExData_Plotting1/")
data = read.csv("household_power_consumption.txt",,sep=c(";"), colClasses=c("character", "character", rep("numeric",7)))  # read csv file 

data2 <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

png("plot1.png", width = 480, height = 480, bg = "transparent")
with(data2, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()
