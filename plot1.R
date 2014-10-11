## Plot1
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


## Plot1 
hist(data$Global_active_power, main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 


## Saving to file 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
