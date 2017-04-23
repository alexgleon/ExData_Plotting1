#23/04/2017 Oliver González
#Peer-graded Assignment: Week1 Peer-graded Assignment: Course Project 1
#output: plot4.png

#Setting working Directory and File
setwd("~/RWkngdrctry/plotting")
File <- "household_power_consumption.txt"

# Reading, naming and subsetting data
source <- read.table(File,skip=1,sep=";")
names(source) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset <- source[source$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
subset$Time <- strptime(subset$Time, format="%H:%M:%S")
subset[1:1440,"Time"] <- format(subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset[1441:2880,"Time"] <- format(subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

#plotting the 4 plots that form the graph
with(subset,{
  plot(subset$Time,as.numeric(as.character(subset$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subset$Time,as.numeric(as.character(subset$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subset$Time,subset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subset,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subset,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subset,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subset$Time,as.numeric(as.character(subset$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()