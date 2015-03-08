## This piece of code is part of PRoject 1 of Exploratory Data Analysis course on Coursera

## This file reads Data from household_power_consumption.txt file
## Then Creates three Sub_Metering line graphs in one plot as per the instructions

# Set the working directory
setwd("E:\\Coursera\\Exploratory Data Analysis\\Projects\\Project 1\\exdata-data-household_power_consumption")


# Read the data
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")


# Subset the data for the 2 dates of 1/2/2007 and 2/2/2007
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

# Create the DataTime column
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")


# plot the graph on the screen to verify correctness of the graph; use type = "l" to get the line graph
plot(hpc_s$DateTime, hpc_s$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
# Annotate the plot with line graphs for Sub_metering_2 & Sub_metering_3
lines(hpc_s$DateTime, hpc_s$Sub_metering_2, type ="l", col = "red")
lines(hpc_s$DateTime, hpc_s$Sub_metering_3, type ="l", col = "blue")
# Annotate the legend.
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")

## Close the PNG device!
dev.off()