#23/04/2017 Oliver González
#Peer-graded Assignment: Week1 Peer-graded Assignment: Course Project 1
#output: plot3.png

#Setting working Directory and File
setwd("~/RWkngdrctry/plotting")
File <- "household_power_consumption.txt"

# Reading, naming and subsetting data
source <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- source[source$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()