
data = read.table("household_power_consumption.txt", sep=';', header=TRUE) 

data <-subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

data$Date<- strptime(data$Date, format='%e/%m/%Y')

data$Date<-as.Date(data$Date,"%m/%d/%Y" )

data$Global_active_power<-as.numeric(as.character(data$Global_active_power))


png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main="Global Active Power", 
                                     xlab="Global Active Power(kilowatts)", col="Red")
dev.off()

