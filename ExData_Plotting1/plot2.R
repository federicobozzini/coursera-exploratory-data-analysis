# set locale to english
Sys.setlocale("LC_TIME", "C")
# load data
data <- read.csv("~/software/exdata/household_power_consumption.txt", sep=";")
# set dates
data$realDate <- as.Date(data$Date, '%d/%m/%Y')
# filter data
plotData <- subset(data, realDate >= as.Date('2007/02/01') & realDate <= as.Date('2007/02/02'))
# interpret global active power as number
plotData$realGlobal_active_power <- as.numeric(as.vector(plotData$Global_active_power))
# temporary store the date time
plotData$dateTime <- paste(plotData$Date, ' ', plotData$Time)
# set real date times
plotData$realDateTime <- strptime(plotData$dateTime, format="%d/%m/%Y %H:%M:%S")
# set png as the output device
png(filename = "plot2.png", width = 480, height = 480)
# create the plot
plot(x=plotData$realDateTime, y=plotData$realGlobal_active_power, type="l", col="black", main = "", xlab="", ylab="Global Active Power (kilowatts)")
# send the plot to the output device
dev.off()