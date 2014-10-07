##
## Exploratory Data Analysis Course Project 1
##
library(lubridate)

## read in as characters to optimize memory use and avoid autoconversion to factors
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep=";", 
                 colClasses = "character",
                 comment.char = "" )

## subset on dates
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

## convert measurements to the rght class
df[3:9] <- lapply(df[3:9], as.numeric)

## add POSIXlt comliant date and time of the measurements
df$datetime <- parse_date_time(paste(df$Date, df$Time), "dmYHMS")

## generate plot and save it to the PNG file
png(file = "plot3.png")
with(df, {
    plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, type="l", col="red")
    lines(datetime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()