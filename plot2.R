#Loading Data from data file
dataFile <- "/././Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data for dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Conversion of dates using strptime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Change the data type of the globalActivePower parameter.
globalActivePower <- as.numeric(subSetData$Global_active_power)
#Opening PNG device
png("plot2.png", width=480, height=480)
#Plotting datetime vs globalActivePower graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Closing the device
dev.off()
