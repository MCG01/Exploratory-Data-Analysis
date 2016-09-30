
##PLOT 1##

#Load libraries
library(data.table)

#Load the data file 
hpc <- fread("household_power_consumption.txt", na.strings = c("?"))

#Create subset of required data
subSethpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#Construct the png file
png(file="plot1.png", width = 480, height = 480, pointsize = 12, bg = "white")

#Plot data 
hist(subSet$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close 
dev.off()

