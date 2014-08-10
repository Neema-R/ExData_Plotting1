## Coursera Exploratory Data Analysis: Course Project 1 - Plot 1
## Read the data file
## Only using dates 2007-02-01 and 2007-02-02, lines 66638-70957, NAs represented by ?
 
 data <- read.table("household_power_consumption.txt", header=TRUE, sep=';',
                    na.strings="?", nrows=71000, stringsAsFactors=FALSE)
 str(data)

## Converting date and time strings to R Date/Time classes
 
 data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time),
                                             format = "%d/%m/%Y %H:%M:%S"))
 
## Restricting data to 2007-02-01 and 2007-02-02
 
 sub_data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") &
                  DateTime < as.POSIXlt("2007-02-03"))

 hist(sub_data$Global_active_power, xlab="Global Active Power (kilowatts)",
      main="Global Active Power", col="red")

 dev.copy(png, "plot1.png")
 dev.off()
