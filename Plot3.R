Plot3 <- function (){
  png(file="plot3.png", width = 480, height = 480)
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  data <- split(data, data$Date, drop=TRUE)
  Data<- rbind(data$"1/2/2007", data$"2/2/2007")
  DateTime <- paste(Data$Date, Data$Time)
  DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  par(mfcol = c(1,1))
  x1 <- as.numeric(as.character(Data$Sub_metering_1))
  x2 <- as.numeric(as.character(Data$Sub_metering_2))
  x3 <- as.numeric(as.character(Data$Sub_metering_3))
  plot(DateTime,x1, type = 'n', xlab= '', ylab = "Energy sub metering")
  lines(DateTime,x1, col = "black")
  lines(DateTime,x2, col = "red")
  lines(DateTime,x3, col = "blue")
  legend("topright", legend = paste("Sub_metering_",1:3), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col=c("black","red","blue"))
  
  dev.off()
}