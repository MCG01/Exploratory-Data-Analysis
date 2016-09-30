##PLOT 3##

#Load libraries 
library(data.table)

#Load the data file 
hpc <- fread("household_power_consumption.txt", na.strings = c("?"))

#Create subset of required data
subSethpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
subsethpcDate <- strptime(paste(subSethpc$Date, subSethpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subSethpcGAP <- as.numeric(subSethpc$Global_active_power)
subSethpcSM1 <- as.numeric(subSethpc$Sub_metering_1) 
subSethpcSM2 <- as.numeric(subSethpc$Sub_metering_2) 
subSethpcSM3 <- as.numeric(subSethpc$Sub_metering_3) 

#Construct the png file 
png(file="plot3.png", width = 480, height = 480, pointsize = 12, bg = "white")

#Plot data 
plot(subsethpcDate, subSethpcSM1, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
lines(subsethpcDate, subSethpcSM2, type="l", col="red") 
lines(subsethpcDate, subSethpcSM3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

#Close 
dev.off()
