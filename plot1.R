DF <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)

DF1 <- DF
DF1$Date <- as.Date(DF$Date,"%d/%m/%Y")

DF2 <- subset(DF1, (DF1$Date <= as.Date("2007-02-02","%Y-%m-%d")) & (DF1$Date >= as.Date("2007-02-01","%Y-%m-%d")))

DF3 <- DF2
DF3$Date <- strptime(paste(DF2$Date,DF2$Time),"%Y-%m-%d %H:%M:%S")

png("plot1.png", width=480, height=480, units="px")

hist(as.numeric(DF3$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (killowatts)")

dev.off()