## This piece of code is part of PRoject 1 of Exploratory Data Analysis course on Coursera

## This file reads Data from household_power_consumption.txt file
## Then creates four plots in one graph as per the instructions

# Set the working directory
setwd("E:\\Coursera\\Exploratory Data Analysis\\Projects\\Project 1\\exdata-data-household_power_consumption")


# Read the data
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")


# Subset the data for the 2 dates of 1/2/2007 and 2/2/2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

# Create the DataTime column
hpc_s$datetime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")


# To draw 4 plots filled column-wise
par(mfcol = c(2,2))
# to reduce the size of legend-texts
par(cex=0.5)


# Plot the 1st graph
plot(hpc_s$datetime, hpc_s$Global_active_power, type ="l",xlab = "", ylab = "Global Active Power")
title(xlab = "", ylab = "Global Active Power")

# Plot the 2nd graph
plot(hpc_s$datetime, hpc_s$Sub_metering_1, type ="l",xlab = "", ylab = "Energy sub metering")
# Annotate the graph  with line graphs for Sub_metering_2 & Sub_metering_3
lines(hpc_s$datetime, hpc_s$Sub_metering_2, type ="l", col = "red")
lines(hpc_s$datetime, hpc_s$Sub_metering_3, type ="l", col = "blue")
# Annotate the legend.
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

# Plot the 3rd graph
plot(hpc_s$datetime, hpc_s$Voltage, type ="l",xlab = "datetime", ylab = "Voltage")


# Plot the 4th graph
plot(hpc_s$datetime, hpc_s$Global_reactive_power, type ="l",xlab = "datetime", ylab = "Global_reactive_power")


## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")

## Close the PNG device!
dev.off()