library(sqldf)

teste <- rbind(read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007'", header=TRUE, sep=";"),
               read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007'", header=TRUE, sep=";"))

Sys.setlocale("LC_TIME", "English")  


teste$DateTime <- as.POSIXct(paste(teste$Date, teste$Time), format="%d/%m/%Y %H:%M:%S")
plot(y=teste$Global_active_power, x=teste$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()


