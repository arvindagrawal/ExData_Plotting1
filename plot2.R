## This piece of code is part of PRoject 1 of Exploratory Data Analysis course on Coursera

## This file reads Data from household_power_consumption.txt file
## Then Creates the line graph as per the instructions

# Set the working directory
setwd("E:\\Coursera\\Exploratory Data Analysis\\Projects\\Project 1\\exdata-data-household_power_consumption")


# Read the data
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")


# Subset the data for the 2 dates of 1/2/2007 and 2/2/2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

# Create the DataTime column
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

# plot the graph on the screen to verify correctness of the graph; use type = "l" to get the line graph
plot(hpc_s$DateTime, hpc_s$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")

## Close the PNG device!
dev.off() 
