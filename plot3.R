# reads and subsets the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",comment.char="")
data$Date <- as.Date( data$Date, "%d/%m/%Y" )
data.sub <- data[ data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02" ), ]

# creates the DateTime column
data.sub$DateTime <- strptime(paste(data.sub$Date, data.sub$Time), "%Y-%m-%d %H:%M:%S")

# opens the device
png( filename="plot3.png", width=480, height=480, bg = "transparent" )

# creates the plot
with( data.sub, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") )
with( data.sub, lines(DateTime, Sub_metering_2, col="red") )
with( data.sub, lines(DateTime, Sub_metering_3, col="blue") )

# adds the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"))

#closes the device
dev.off()
