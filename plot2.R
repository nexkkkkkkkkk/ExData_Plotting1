## Read in all data, the date and time is read as characters

data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## restrict data to 2007-02-01 and 02 inclusive, store in data2
data2 <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

## Convert date and time to Date/Time class
data2$DateTime <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")


## plot
png(file="plot2.png", width = 480, height = 480, units = "px")

plot((data2$DateTime),data2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()

