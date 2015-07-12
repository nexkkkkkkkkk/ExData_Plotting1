## Read in all data, the date and time is read as characters

data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## restrict data to 2007-02-01 and 02 inclusive
data2 <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]


## plot
png(file="plot1.png", width = 480, height = 480, units = "px")

hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()

