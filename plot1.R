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
df[3:9] <- lapply(df[3:9], as.numeric)

## generate plot and save it to the PNG file
png(file = "plot1.png")
hist(df$Global_active_power, breaks = 20, 
     main = "Global Active Power",
     xlab ="Global Active Power (kilowatts)",
     col = "red")
dev.off()
