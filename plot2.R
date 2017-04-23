#23/04/2017 Oliver González
#Peer-graded Assignment: Week1 Peer-graded Assignment: Course Project 1
#output: plot2.png

#Setting working Directory and File
setwd("~/RWkngdrctry/plotting")
File <- "household_power_consumption.txt"

# Reading, naming and subsetting power consumption data
source <- read.table(File,skip=1,sep=";")
names(source) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset <- source[source$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
subset$Time <- strptime(subset$Time, format="%H:%M:%S")
subset[1:1440,"Time"] <- format(subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset[1441:2880,"Time"] <- format(subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#plotting data
plot(subset$Time,as.numeric(as.character(subset$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
