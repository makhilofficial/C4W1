x <- read.csv2("household_power_consumption.txt")
x <- as.data.frame(x)

for(i in 3:8){
  x[,i] <- as.numeric(x[,i])
}

x <- x[x$Date == c("1/2/2007" , "2/2/2007"), ]

#x[,1] <- as.Date(x[,1],  format="%d/%m/%Y")

datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(file = "plot2.png")
plot(datetime, x$Global_active_power, type = 'l', ylab = "Global Active Power (killowatts)", xlab =  "")
dev.off()