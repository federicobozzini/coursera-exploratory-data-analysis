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
# set png as the output device
png(filename = "plot1.png", width = 480, height = 480)
# create the plot
hist(plotData$realGlobal_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
# send the plot to the output device
dev.off()