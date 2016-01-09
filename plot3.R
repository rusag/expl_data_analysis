#set directory and load the data
path_to_data = "C:\\Users\\Ruslan\\Desktop\\coursera\\exploratory analysis"
setwd(path_to_data)
house_power <- read.csv("household_power_consumption.txt", 
                        sep=";", stringsAsFactors=FALSE)
#manipulate data. create datetime column
hpc <- cbind(Date = as.Date(house_power$Date, "%d/%m/%Y"), house_power[,-1])
hpc <- subset(hpc, subset = (Date >= "2007-02-01" & Date <="2007-02-02"))
hpc$Datetime <- with(hpc, as.POSIXct(paste(Date, Time)))

#working data will be hpc. remove original data
rm(house_power)

#create plot 3
par(mfrow=c(1,1))
with(hpc, {
  plot(Sub_metering_1~Datetime, type="l", cex.lab=0.75, cex.axis=0.75,
       #width = 480  , height = 480,
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7) 
#export plot 3
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

