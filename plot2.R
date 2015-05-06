# reads and subsets the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",comment.char="")
data$Date <- as.Date( data$Date, "%d/%m/%Y" )
data.sub <- data[ data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02" ), ]

# creates the DateTime column
data.sub$DateTime <- strptime(paste(data.sub$Date, data.sub$Time), "%Y-%m-%d %H:%M:%S")

# opens device
png( filename="plot2.png", width=480, height=480, bg = "transparent" )
# generates the plot
with( data.sub, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") )
# closes the device
dev.off()

