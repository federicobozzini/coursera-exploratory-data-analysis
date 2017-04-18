# set locale to english
Sys.setlocale("LC_TIME", "C")
# load data
data <- read.csv("~/software/exdata/household_power_consumption.txt", sep=";")
# set dates
data$realDate <- as.Date(data$Date, '%d/%m/%Y')
# filter data
plotData <- subset(data, realDate >= as.Date('2007/02/01') & realDate <= as.Date('2007/02/02'))
# interpret sub metering as number
plotData$realSub_metering_1 <- as.numeric(as.vector(plotData$Sub_metering_1))
plotData$realSub_metering_2 <- as.numeric(as.vector(plotData$Sub_metering_2))
plotData$realSub_metering_3 <- as.numeric(as.vector(plotData$Sub_metering_3))
# temporary store the date time
plotData$dateTime <- paste(plotData$Date, ' ', plotData$Time)
# set real date times
plotData$realDateTime <- strptime(plotData$dateTime, format="%d/%m/%Y %H:%M:%S")
# set png as the output device
png(filename = "plot3.png", width = 480, height = 480)
# create the plot
plot(x=plotData$realDateTime, y=plotData$realSub_metering_1, type="l", col="black", main = "", xlab="", ylab="Energy sub metering")
lines(x=plotData$realDateTime, y=plotData$realSub_metering_1, col ="black")
lines(x=plotData$realDateTime, y=plotData$realSub_metering_2, col ="red")
lines(x=plotData$realDateTime, y=plotData$realSub_metering_3, col ="blue")
legend('topright', pch=1, col=c('black', 'red', 'blue'), legend=c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'))
# send the plot to the output device
dev.off()