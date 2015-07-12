
data = read.table("household_power_consumption.txt", sep=';', header=TRUE) 



data <-subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

data$DateTime<-paste(data$Date, data$Time)

data$DateTime<- strptime(data$DateTime, format='%e/%m/%Y %H:%M:%S')

data$Date<-as.Date(data$Date,"%m/%d/%Y %H:%M:%S" )


data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))

png(filename="plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type="n",  ylab="Energfy sub meeting", xlab="")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="Red")
lines(data$DateTime, data$Sub_metering_3, col="Blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
