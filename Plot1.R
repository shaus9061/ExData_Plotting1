Plot1 <- function(){
  png(file="plot1.png", width = 480, height = 480)
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  data <- split(data, data$Date, drop=TRUE)
  Data<- rbind(data$"1/2/2007", data$"2/2/2007")
  DateTime <- paste(Data$Date, Data$Time)
  DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  par(mfcol = c(1,1))
  x <- as.numeric(as.character(Data$Global_active_power))
  good <- complete.cases(x)
  x<- x[good]
  hist(x, col = "red", breaks = 11, xlab = "Global Active Power (kilowatts)", main =  "Global Active Power")
  
  dev.off()
}