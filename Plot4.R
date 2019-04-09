#set working directory
setwd("C:/NEX180593 - Tutorial 7/data")

library(data.table)

## Getting full dataset
AD4<-fread("./household_power_consumption.txt", na.strings="?")

AD4$Date <- as.Date(AD4$Date, format="%d/%m/%Y")

## Subsetting the data
AD4.filter <- subset(AD4, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(AD4)

## Converting dates
datetime <- paste(as.Date(AD4.filter$Date), AD4.filter$Time)
AD4.filter$Datetime <- as.POSIXct(datetime)

#plot the graph with legends
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(AD4.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})

#Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
