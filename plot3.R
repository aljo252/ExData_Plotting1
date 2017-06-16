data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data2 <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")
data2<-cbind(data2, "DateTime" = as.POSIXct(paste(data2$Date, data2$Time)))

png("plot3.png", width=400, height=400)


plot(data2$Time, data2$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data2$Time, data$Sub_metering_2, col="red")
lines(data2$Time, data22$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()
