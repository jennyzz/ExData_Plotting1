plot1 <- function (){
##code for reading the data:
dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
date <- dataset$Date
library(lubridate) ## use lubridate package to work with date
factor <- (dmy(date) == ymd("2007-02-01")) | (dmy(date) == ymd("2007-02-02"))
new_dataset <- dataset[factor,]  ## dataset contains only the data from the dates 2007-02-01 and  2007-02-02.

##plot1:
Global_active_power <- as.numeric(as.character(new_dataset$Global_active_power)) ##subset  Global_active_power data and change factor to numeric
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(Global_active_power,col="red", xlab="Global Active Power (kilowatts)",  ylab="Frequency",main="Global Active Power")
dev.off()
}