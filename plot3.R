plot3 <- function (){
##code for reading the data:
dataset <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";")
date <- dataset$Date
library(lubridate) ## use lubridate package to work with date
factor <- (dmy(date) == ymd("2007-02-01")) | (dmy(date) == ymd("2007-02-02"))
new_dataset <- dataset[factor,]  ## dataset contains only the data from the dates 2007-02-01 and  2007-02-02.

##plot3:
Sub_metering_1 <- as.numeric(as.character(new_dataset$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(new_dataset$Sub_metering_2))
class(new_dataset$Sub_metering_3)
Sub_metering_3 <- new_dataset$Sub_metering_3

date <- as.character(dmy(new_dataset$Date))
time <- as.character(new_dataset$Time)
datetime <- paste(date, time)

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(ymd_hms(datetime),Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(ymd_hms(datetime),Sub_metering_2, type="l", col= "red")
lines(ymd_hms(datetime),Sub_metering_3, type="l", col= "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"))
dev.off()
}