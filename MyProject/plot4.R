
library(sqldf)
Sys.setlocale("LC_TIME", "English")  

teste <- rbind(read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007'", header=TRUE, sep=";"),
               read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007'", header=TRUE, sep=";"))


teste$DateTime <- as.POSIXct(paste(teste$Date, teste$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
with(teste,   
{
  plot(y=Global_active_power, x=DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(y=Voltage, DateTime, type="l", ylab="Voltage", xlab="datetime")
  
  plot(y=teste$Sub_metering_1, x=teste$DateTime, type="l", ylab="Energy sub metering", xlab="")
  lines(y=teste$Sub_metering_2, x=teste$DateTime, type="l",col="RED")
  lines(y=teste$Sub_metering_3, x=teste$DateTime, type="l",col="BLUE")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("BLACK", "RED", "BLUE"),  lty=1, lwd=2)
  
  plot(y=Global_reactive_power, DateTime, type="l",  xlab="datetime")  
  
})

dev.copy(png, file="plot4.png")
dev.off()



  