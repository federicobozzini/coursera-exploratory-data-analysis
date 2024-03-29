NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
byYear <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)
png(filename = "plot1.png", width = 480, height = 480)
barplot(byYear$x/1000, names.arg=byYear$year, ylab="PM2.5 emissions (1000 tons)")
dev.off()