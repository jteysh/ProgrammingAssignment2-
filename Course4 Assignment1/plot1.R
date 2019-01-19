library("data.table")

setwd("~/Coursera/Course4 Assignment1")

electricpowerDT <- data.table::fread(input = "household_power_consumption.txt"
                                     , na.strings="?"
)

electricpowerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

electricpowerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
electricpowerDT <- electricpowerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(electricpowerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()