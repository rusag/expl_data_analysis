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

#create plot 1
par(mfrow=c(1,1))
hist(as.numeric(hpc$Global_active_power) ,col='red',
     cex.lab=0.8, cex.main=0.8, cex.axis=0.8,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
#export plot1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

#;-)