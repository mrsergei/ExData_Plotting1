##
## Exploratory Data Analysis Course Project 1
##

## read in as characters to optimize memory use
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep=";", 
                 colClasses = "character",
                 comment.char = "" )

## subset on dates
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

## concert to the rght format
df[,3:9] <- lapply(df[,3:9], as.numeric)

## add POSIXlt comliant date and time of the measurements
df$datetime <- strptime(paste(as.Date(df$Date, "%d/%m/%Y"), df$Time), "%Y-%m-%d %H:%M:%S")

## generate plot and save it to the PNG file
#png(file = "plot4.png")
par(mfcol = c(2, 2))
with(df, plot(datetime, Global_active_power, type='l',
     xlab = "",
     ylab ="Global Active Power (kilowatts)"))
with(df, plot(datetime, Sub_metering_1, type="l",
     xlab = "",
     ylab = "Energy sub metering"))
with(df, lines(datetime, Sub_metering_2, type="l", col="red"))
with(df, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(df, plot(datetime, Voltage, type = "l"))
with(df, plot(datetime, Global_reactive_power, type = "l"))
#dev.off()

