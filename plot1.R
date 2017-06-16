data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data2 <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")
data2<-cbind(data2, "DateTime" = as.POSIXct(paste(data2$Date, data2$Time)))

png("plot1.png", width=400, height=400)

hist(data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()