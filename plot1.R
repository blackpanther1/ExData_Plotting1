#Loading Data from data file

dataFile <- "/././Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data for dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Change the data type of the globalActivePower parameter.
globalActivePower <- as.numeric(subSetData$Global_active_power)
#Opening PNG device
png("plot1.png", width=480, height=480)
#Plotting hitogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Close device
dev.off()
