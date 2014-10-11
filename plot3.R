##Plot3
## Read data 
data_all <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y") 


## Subset data for the desired range
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates 
datetime <- paste(as.Date(data$Date), data$Time) 
## Append a column Datetime
data$Datetime <- as.POSIXct(datetime) 

## Plot 3 
with(data, { 
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="") 
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue') 
}) 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


## Saving to file 
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 
#
