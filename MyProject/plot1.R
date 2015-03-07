
library(sqldf)

teste <- rbind(read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007'", header=TRUE, sep=";"),
               read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007'", header=TRUE, sep=";"))

hist(teste$Global_active_power, col="RED", xlab="Global Active Power (kilowatts)", main="Global Active Power" )

dev.copy(png, file="plot1.png")
dev.off()