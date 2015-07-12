## Read in all data, the date and time is read as characters

data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## restrict data to 2007-02-01 and 02 inclusive, store in data2
data2 <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

## Convert date and time to Date/Time class
data2$DateTime <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")


## plot
png(file="plot3.png", width = 480, height = 480, units = "px")

plot(range(data2$DateTime),range(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3),type="n",ylab="Energy sub metering",xlab="")

lines(data2$DateTime,data2$Sub_metering_1,col="black",type="l")
lines(data2$DateTime,data2$Sub_metering_2,col="red",type="l")
lines(data2$DateTime,data2$Sub_metering_3,col="blue",type="l")

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

