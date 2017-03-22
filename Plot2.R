
# Plot2


dataFile <- "d:/Users/s36559/Desktop/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
HPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(HPC$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
