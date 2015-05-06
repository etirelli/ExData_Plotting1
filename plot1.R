# reads and subsets the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",comment.char="")
data$Date <- as.Date( data$Date, "%d/%m/%Y" )
data.sub <- data[ data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02" ), ]

# opens device
png( filename="plot1.png", width=480, height=480, bg = "transparent" )
# generates histogram
with( data.sub, hist(Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red") )
# closes the device
dev.off()
