
data = read.table("household_power_consumption.txt", sep=';', header=TRUE) 



data <-subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

data$DateTime<-paste(data$Date, data$Time)

data$DateTime<- strptime(data$DateTime, format='%e/%m/%Y %H:%M:%S')

data$Date<-as.Date(data$Date,"%m/%d/%Y %H:%M:%S" )


data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$Voltage<-as.numeric(as.character(data$Voltage))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))

png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, type="n",  ylab="Global Active Power" , xlab="")
lines(data$DateTime, data$Global_active_power)


plot(data$DateTime, data$Voltage, type="n",  ylab="Voltage", xlab="datetime")
lines(data$DateTime, data$Voltage)



plot(data$DateTime, data$Sub_metering_1, type="n",  ylab="Energfy sub meeting", xlab="")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="Red")
lines(data$DateTime, data$Sub_metering_3, col="Blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")


plot(data$DateTime, data$Global_reactive_power, type="n",  ylab="Global_reactive_power", xlab="datetime")
lines(data$DateTime, data$Global_reactive_power)


dev.off()

