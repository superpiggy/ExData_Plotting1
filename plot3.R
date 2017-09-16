filename <- file.path("data", "household_power_consumption.txt")
hpc <- read.csv(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE)
subHpc <- subset(hpc, as.Date(Date, "%d/%m/%Y") >= as.Date("01/2/2007", "%d/%m/%Y") 
                 & as.Date(Date, "%d/%m/%Y") <= as.Date("02/2/2007", "%d/%m/%Y"))

dt <- strptime(paste(subHpc$Date, subHpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(dt, as.numeric(subHpc$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(dt, as.numeric(subHpc$Sub_metering_2), type="l", col="red")
lines(dt, as.numeric(subHpc$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()