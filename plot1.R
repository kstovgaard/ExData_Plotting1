# Script for plotting histogram of Global Active Power from 2007-02-01 to 2007-02-02

# Parse the data file
power_dataframe = read.csv("household_power_consumption.txt",sep=";",na.strings="?")

# convert Date column to comparable format
power_dataframe$Date <- as.Date(as.character(power_dataframe$Date),format = "%d/%m/%Y")

# Subset by requested dates
StartDate <- as.Date("2007-02-01")
EndDate <- as.Date("2007-02-02")
sel_powerdata <- power_dataframe[power_dataframe$Date >= StartDate & power_dataframe$Date <= EndDate, ]

#Construct the histogram following the provided example and save to png (no reason to display)
png("plot1.png",width=480,height=480)
hist(sel_powerdata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
