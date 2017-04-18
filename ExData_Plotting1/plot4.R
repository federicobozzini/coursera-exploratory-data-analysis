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
# interpret sub metering as number
plotData$realSub_metering_1 <- as.numeric(as.vector(plotData$Sub_metering_1))
plotData$realSub_metering_2 <- as.numeric(as.vector(plotData$Sub_metering_2))
plotData$realSub_metering_3 <- as.numeric(as.vector(plotData$Sub_metering_3))
# interpret global reactive power as number
plotData$realGlobal_reactive_power <- as.numeric(as.vector(plotData$Global_reactive_power))
# interpret global reactive power as number
plotData$realVoltage <- as.numeric(as.vector(plotData$Voltage))
# temporary store the date time
plotData$dateTime <- paste(plotData$Date, ' ', plotData$Time)
# set real date times
plotData$realDateTime <- strptime(plotData$dateTime, format="%d/%m/%Y %H:%M:%S")
# set png as the output device
png(filename = "plot4.png", width = 480, height = 480)
# four plot on the same image
par(mfrow=c(2,2))
# create the 1th plot
plot(x=plotData$realDateTime, y=plotData$realGlobal_active_power, type="l", col="black", main = "", xlab="", ylab="Global Active Power")
# create the 2th plot
plot(x=plotData$realDateTime, y=plotData$realVoltage, type="l", col="black", main = "", xlab="datetime", ylab="Voltage")
# create the 3th plot
plot(x=plotData$realDateTime, y=plotData$realSub_metering_1, type="l", col="black", main = "", xlab="", ylab="Energy sub metering")
lines(x=plotData$realDateTime, y=plotData$realSub_metering_1, col ="black")
lines(x=plotData$realDateTime, y=plotData$realSub_metering_2, col ="red")
lines(x=plotData$realDateTime, y=plotData$realSub_metering_3, col ="blue")
legend('topright', pch=1, col=c('black', 'red', 'blue'), legend=c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'))
# create the 4th plot
plot(x=plotData$realDateTime, y=plotData$realGlobal_reactive_power, type="l", col="black", main = "", xlab="datetime", ylab="global_reactive_power")
# send the plot to the output device
dev.off()