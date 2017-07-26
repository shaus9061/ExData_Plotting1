Plot4 <- function(){
  png(file="plot4.png", width = 480, height = 480)
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  data <- split(data, data$Date, drop=TRUE)
  Data<- rbind(data$"1/2/2007", data$"2/2/2007")
  DateTime <- paste(Data$Date, Data$Time)
  DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  par(mfcol=c(2,2), mar = c(4,4,3,3))
  GAPower <- as.numeric(as.character(Data$Global_active_power))
  plot(DateTime,GAPower, type = 'n', xlab= '', ylab = "Global Active Power")
  lines(DateTime,GAPower)
  
  x1 <- as.numeric(as.character(Data$Sub_metering_1))
  x2 <- as.numeric(as.character(Data$Sub_metering_2))
  x3 <- as.numeric(as.character(Data$Sub_metering_3))
  plot(DateTime,x1, type = 'n', xlab= '', ylab = "Energy sub metering")
  lines(DateTime,x1, col = "black")
  lines(DateTime,x2, col = "red")
  lines(DateTime,x3, col = "blue")
  legend("topright", legend = paste("Sub_metering_",1:3), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col=c("black","red","blue"), bty = 'n')
  
  Voltage <- as.numeric(as.character(Data$Voltage))
  plot(DateTime,Voltage, type = 'n', xlab= "datetime", ylab = "Voltage")
  lines(DateTime,Voltage)
  
  GRPower <- as.numeric(as.character(Data$Global_reactive_power))
  plot(DateTime,GRPower, type = 'n', xlab= "datetime", ylab = "Global_reactive_power")
  lines(DateTime,GRPower)
  
  dev.off()
}