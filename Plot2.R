
data = read.table("household_power_consumption.txt", sep=';', header=TRUE) 



data <-subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

data$DateTime<-paste(data$Date, data$Time)

data$DateTime<- strptime(data$DateTime, format='%e/%m/%Y %H:%M:%S')

data$Date<-as.Date(data$Date,"%m/%d/%Y %H:%M:%S" )


data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

png(filename="plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type="n",  ylab="Global Active Power(kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()

