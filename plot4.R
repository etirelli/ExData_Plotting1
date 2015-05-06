# reads and subsets the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",comment.char="")
data$Date <- as.Date( data$Date, "%d/%m/%Y" )
data.sub <- data[ data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02" ), ]

# creates the DateTime column
data.sub$DateTime <- strptime(paste(data.sub$Date, data.sub$Time), "%Y-%m-%d %H:%M:%S")

# opens the device
png( filename="plot4.png", width=480, height=480, bg = "transparent" )

# sets canvas to a 2x2 grid 
par(mfrow=c(2,2))

# adds the first chart
with( data.sub, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="") )

# adds the second chart
with( data.sub, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime") )

# adds the third chart
with( data.sub, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") )
with( data.sub, lines(DateTime, Sub_metering_2, col="red") )
with( data.sub, lines(DateTime, Sub_metering_3, col="blue") )
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"), bty="n")

# adds the fourth chart
with( data.sub, plot(DateTime, Global_reactive_power, type="l", xlab="datetime") )

# closes the device
dev.off()
