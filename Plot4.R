
# Plot 4 


dataFile <- "d:/Users/s36559/Desktop/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
HPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


SubM1 <- as.numeric(HPC$Sub_metering_1)
SubM2 <- as.numeric(HPC$Sub_metering_2)
SubM3 <- as.numeric(HPC$Sub_metering_3)
Voltage <- as.numeric(HPC$Voltage)
Global_reactive_power <- as.numeric(HPC$Global_reactive_power)
Global_active_power <- as.numeric(HPC$Global_active_power)
#Let's have fun with the color coz we don't really care about base plot in R actually....
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", col = 'purple')

plot(datetime, Voltage, type="l", xlab="", ylab="Voltage", col = 'pink')

plot(datetime, HPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col = 'seagreen3')
lines(datetime, HPC$Sub_metering_2, type="l", col = 'darkgoldenrod1')
lines(datetime, HPC$Sub_metering_3, type="l", col = 'turquoise3')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("seagreen3", "darkgoldenrod1", "turquoise3"))

plot(datetime, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power (kilowatts)", col = 'green')

dev.off()

