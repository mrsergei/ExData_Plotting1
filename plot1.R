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
#png(file = "plot1.png")
hist(df$Global_active_power, breaks=20, 
     main = "Global Active Power",
     xlab ="Global Active Power (kilowatts)",
     col = "red")
#dev.off()