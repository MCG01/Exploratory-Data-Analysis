
##PLOT 2##

#Load libraries 
library(data.table)

#Load the data file 
hpc <- fread("household_power_consumption.txt", na.strings = c("?"))

#Create subset of required data
subSethpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
subsethpcDate <- strptime(paste(subSethpc$Date, subSethpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subSethpcGAP <- as.numeric(subSethpc$Global_active_power)

#Construct the png file 
png(file="plot2.png", width = 480, height = 480, pointsize = 12, bg = "white")

#Plot data 
plot(subsethpcDate, subSethpcGAP, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

#Close 
dev.off()

