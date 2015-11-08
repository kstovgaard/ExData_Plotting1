# Script for combining 4 subplots of the power consumption data set

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

#Construct the combined plot following the provided example and save to png (no reason to display)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(sel_powerdata$DateTime,sel_powerdata$Global_active_power,ylab = "Global Active Power",xlab="",type="l")

plot(sel_powerdata$DateTime,sel_powerdata$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(sel_powerdata$DateTime,sel_powerdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(sel_powerdata$DateTime,sel_powerdata$Sub_metering_1,col="black")
lines(sel_powerdata$DateTime,sel_powerdata$Sub_metering_2,col="red")
lines(sel_powerdata$DateTime,sel_powerdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

plot(sel_powerdata$DateTime,sel_powerdata$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
