plot2 <- function (){
##code for reading the data:
dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
date <- dataset$Date
library(lubridate) ## use lubridate package to work with date
factor <- (dmy(date) == ymd("2007-02-01")) | (dmy(date) == ymd("2007-02-02"))
new_dataset <- dataset[factor,]  ## dataset contains only the data from the dates 2007-02-01 and  2007-02-02.

##plot2:
date <- as.character(dmy(new_dataset$Date))
time <- as.character(new_dataset$Time)
datetime <- paste(date, time)
Global_active_power <- as.numeric(as.character(new_dataset$Global_active_power)) ##subset  Global_active_power data and change factor to numeric
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(ymd_hms(datetime),Global_active_power, type="l", xlab="",ylab="Global Active Power  (kilowatts)")
dev.off()
}