filename <- file.path("data", "household_power_consumption.txt")
hpc <- read.csv(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE)
subHpc <- subset(hpc, as.Date(Date, "%d/%m/%Y") >= as.Date("01/2/2007", "%d/%m/%Y") 
                 & as.Date(Date, "%d/%m/%Y") <= as.Date("02/2/2007", "%d/%m/%Y"))

dt <- strptime(paste(subHpc$Date, subHpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dt, as.numeric(subHpc$Global_active_power), type="l", xlab="", ylab="Global Active Power")

plot(dt, as.numeric(subHpc$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(dt, as.numeric(subHpc$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(dt, as.numeric(subHpc$Sub_metering_2), type="l", col="red")
lines(dt, as.numeric(subHpc$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, bty="n", cex=0.9, col=c("black", "red", "blue"))

plot(dt, as.numeric(subHpc$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()