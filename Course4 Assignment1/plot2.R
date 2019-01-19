library("data.table")

setwd("~/Coursera/Course4 Assignment1")

electricpowerDT <- data.table::fread(input = "household_power_consumption.txt"
                                     , na.strings="?"
)

electricpowerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

electricpowerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
electricpowerDT <- electricpowerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = electricpowerDT[, dateTime]
     , y = electricpowerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()