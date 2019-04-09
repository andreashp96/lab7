#set working directory
setwd("C:/NEX180593 - Tutorial 7")

library(data.table)

# full dataset
AnalyzedData2<-fread("./household_power_consumption.txt", na.strings="?")

# date format
AnalyzedData2$Date <- as.Date(AnalyzedData2$Date, format="%d/%m/%Y")

## Subsetting the data
AnalyzedData2.filter <- subset(AnalyzedData2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(AnalyzedData2.filter$Date), AnalyzedData2.filter$Time)
AnalyzedData2.filter$Datetime <- as.POSIXct(datetime)

#output histogram to png file
plot(AnalyzedData2.filter$Global_active_power~AnalyzedData2.filter$Datetime, 
     type="l",
     ylab="Global Active Power (in kilowatts)", 
     xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
