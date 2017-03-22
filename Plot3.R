
# Plot3


dataFile <- "d:/Users/s36559/Desktop/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
HPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


SubM1 <- as.numeric(HPC$Sub_metering_1)
SubM2 <- as.numeric(HPC$Sub_metering_2)
SubM3 <- as.numeric(HPC$Sub_metering_3)

#Let's have fun with the color coz we don't really care about base plot in R actually....

png("plot3.png", width=480, height=480)
plot(datetime, HPC$Sub_metering_1, type="l", xlab="", ylab="", col = 'red')
lines(datetime, HPC$Sub_metering_2, type="l", col = 'blue')
lines(datetime, HPC$Sub_metering_3, type="l", col = 'purple')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("red", "blue", "purple"))
dev.off()
