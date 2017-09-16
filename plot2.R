filename <- file.path("data", "household_power_consumption.txt")
hpc <- read.csv(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE)
subHpc <- subset(hpc, as.Date(Date, "%d/%m/%Y") >= as.Date("01/2/2007", "%d/%m/%Y") 
                 & as.Date(Date, "%d/%m/%Y") <= as.Date("02/2/2007", "%d/%m/%Y"))

gap <- as.numeric(subHpc$Global_active_power)
dt <- strptime(paste(subHpc$Date, subHpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)

plot(dt, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()