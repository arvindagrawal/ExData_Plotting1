## This piece of code is part of PRoject 1 of Exploratory Data Analysis course on Coursera

## This file reads Data from household_power_consumption.txt file
## Then Creates the Histogram as per the instructions

# Set the working directory
setwd("E:\\Coursera\\Exploratory Data Analysis\\Projects\\Project 1\\exdata-data-household_power_consumption")


# Read the data
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")


# Subset the data for the 2 dates of 1/2/2007 and 2/2/2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]


# plot the graph on the screen to verify correctness of the graph
hist(hpc_s$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")

## Close the PNG device!
dev.off() 
