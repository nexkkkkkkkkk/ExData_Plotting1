## Read in all data, the date and time is read as characters

data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## restrict data to 2007-02-01 and 02 inclusive, store in data2
data2 <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

## Convert date and time to Date/Time class
data2$DateTime <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")


## plot 4 graphs
png(file="plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2),cex.lab=.9)
# 1st plot
plot((data2$DateTime),data2$Global_active_power,type="l",ylab="Global Active Power",xlab="")

# 2nd plot
plot((data2$DateTime),data2$Voltage,type="l",ylab="Voltage",xlab="datetime")

# 3rd plot
plot(range(data2$DateTime),range(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3),type="n",ylab="Energy sub metering",xlab="")

lines(data2$DateTime,data2$Sub_metering_1,col="black",type="l")
lines(data2$DateTime,data2$Sub_metering_2,col="red",type="l")
lines(data2$DateTime,data2$Sub_metering_3,col="blue",type="l")

legend("topright",box.lwd=0,bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.9)

# 4th plot
plot((data2$DateTime),data2$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()

