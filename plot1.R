x <- read.csv2("household_power_consumption.txt")
x <- as.data.frame(x)
for(i in 3:8){
  x[,i] <- as.numeric(x[,i])
}

x <- x[x$Date == c("1/2/2007" , "2/2/2007"), ]
head(x)        
png(file = "plot1.png")
hist(x$Global_active_power, col = "orange", breaks = 11, main = "Global active power", xlab = "Global Active Power (Kilowatts)")
dev.off()