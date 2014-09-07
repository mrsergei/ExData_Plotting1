##
## Exploratory Data Analysis Course Project 1
##


## read in as characters to optimize memory use and avoid autoconversion to factors
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep=";", 
                 colClasses = "character",
                 comment.char = "" )

## subset on dates
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

## convert measurements to the rght class
df[,3:9] <- lapply(df[,3:9], as.numeric)

## add POSIXlt comliant date and time of the measurements
df$datetime <- strptime(paste(as.Date(df$Date, "%d/%m/%Y"), df$Time), "%Y-%m-%d %H:%M:%S")

## generate plot and save it to the PNG file
png(file = "plot2.png")
with(df, plot(datetime, Global_active_power, type='l',
              xlab = "",
              ylab ="Global Active Power (kilowatts)"))
dev.off()
