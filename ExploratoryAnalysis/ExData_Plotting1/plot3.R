#######################################################
#PLot 3 : Trend plot
#######################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables

setwd("C:/Users/esrihan/Documents/Learning/Coursera/DSToolbox/ExploratoryAnalysis/ExData_Plotting1")
fileToRead = "household_power_consumption.txt"
par(mfrow = c(1,1))

### Step 2 : Read the semi-colon delimited file
data <- read.table(fileToRead,
                   header=TRUE,
                   sep=";",         # use ";" for semi-colon delimited files
                   stringsAsFactors=FALSE, 
                   dec="."
)

new_data <- subset(data,Global_active_power!="?" & (Date %in% c("1/2/2007","2/2/2007")))

## Concatenate the Date and Time and Convert them into a Date with Time
datetime <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Global_active_power <- as.numeric(new_data$Global_active_power);

with(new_data,plot(datetime,Sub_metering_1,xlab=" ",ylab="Energy Sub Metering",pch="."),
     plot(datetime,Sub_metering_2,xlab=" ",ylab="Energy Sub Metering",pch="."),
     plot(datetime,Sub_metering_3,xlab=" ",ylab="Energy Sub Metering",pch="."))
lines(datetime,new_data$Sub_metering_1,col="black")
lines(datetime,new_data$Sub_metering_2,col="red")
lines(datetime,new_data$Sub_metering_3,col="blue")

legend("topright",pch="_",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       ncol = 1,
       cex = 0.82)

### Step 3 : Copy to a png file
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
