DF <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)

DF1 <- DF
DF1$Date <- as.Date(DF$Date,"%d/%m/%Y")

DF2 <- subset(DF1, (DF1$Date <= as.Date("2007-02-02","%Y-%m-%d")) & (DF1$Date >= as.Date("2007-02-01","%Y-%m-%d")))

DF3 <- DF2
DF3$Date <- strptime(paste(DF2$Date,DF2$Time),"%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480, units="px")

plot(DF3$Date,DF3$Sub_metering_1,type="l",xlab = "", ylab = "Energy sub metering")
lines(DF3$Date,DF3$Sub_metering_2,type="l",col="red")
lines(DF3$Date,DF3$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

dev.off()