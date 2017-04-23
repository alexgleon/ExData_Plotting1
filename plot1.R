#23/04/2017 Oliver González
#Peer-graded Assignment: Week1 Peer-graded Assignment: Course Project 1
#output: plot1.png

#Setting working Directory and File
setwd("~/RWkngdrctry/plotting")
File <- "household_power_consumption.txt"

#Reading, naming and subsetting source consumption data
source <- read.table(File,skip=1,sep=";")
names(source) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset <- source[source$Date %in% c("1/2/2007","2/2/2007") ,]
  
#plotting data
hist(as.numeric(as.character(subset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

