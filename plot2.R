# Script for plotting Global Active Power curve from 2007-02-01 to 2007-02-02

# Parse the data file
power_dataframe <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

# convert Date column to comparable format
power_dataframe$Date <- as.Date(as.character(power_dataframe$Date),format = "%d/%m/%Y")

# Subset by requested dates
StartDate <- as.Date("2007-02-01")
EndDate <- as.Date("2007-02-02")
sel_powerdata <- power_dataframe[power_dataframe$Date >= StartDate & power_dataframe$Date <= EndDate, ]

# Merge data and time columns
sel_powerdata$DateTime <- strptime(paste(sel_powerdata$Date, sel_powerdata$Time), "%Y-%m-%d %H:%M:%S") 

#Construct the plot following the provided example and save to png (no reason to display)
png("plot2.png",width=480,height=480)
plot(sel_powerdata$DateTime,sel_powerdata$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
