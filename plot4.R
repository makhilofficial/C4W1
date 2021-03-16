x <- read.csv2("household_power_consumption.txt")
x <- as.data.frame(x)

for(i in 3:8){
  x[,i] <- as.numeric(x[,i])
}

x <- x[x$Date == c("1/2/2007" , "2/2/2007"), ]

#x[,1] <- as.Date(x[,1],  format="%d/%m/%Y")

datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
x <- cbind(x, datetime)
head(x)


png("plot4.png")
par(mfrow = c(2,2))
with(x, {
        plot(datetime, x$Global_active_power, type = 'l', ylab = "Global Active Power (killowatts)", xlab =  "")
        plot(datetime, x$Voltage, type = 'l', ylab = "Voltage")
        plot(datetime, x$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(x$datetime, x$Sub_metering_2, type =  'l', col = "Red")
lines(x$datetime, x$Sub_metering_3, type =  'l', col = "Blue")
legend("topright", col = c("black", "red", "blue"),lty= 1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datetime, x$Global_reactive_power, type = 'l', ylab = "Global Reactive power")
})

#with(x, plot(with(x, plot(datetime, x$Sub_metering_1, type = 'l'))
#lines(x$datetime, x$Sub_metering_2, type =  'l', col = "Red")
#lines(x$datetime, x$Sub_metering_3, type =  'l', col = "Blue")
#legend("topright", col = c("black", "red", "blue"),lty= 1, lwd=2, 
      #legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))))

dev.off()