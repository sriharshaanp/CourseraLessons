#######################################################
#PLot 4 : Plotting multiple plots in one plot 
#######################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables

setwd("C:/Users/esrihan/Documents/Learning/Coursera/DSToolbox/ExploratoryAnalysis/ExData_Plotting1")
fileToRead = "household_power_consumption.txt"
par(mfcol = c(2,2))

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

# Plotting the First Graph
Global_active_power <- as.numeric(new_data$Global_active_power)
with(new_data,plot(datetime,Global_active_power,pch=".",xlab = " "))
lines(datetime,Global_active_power)

# Plotting the Second Graph
with(new_data,plot(datetime,Sub_metering_1,xlab=" ",ylab="Energy Sub Metering",pch="."),
     plot(datetime,Sub_metering_2,xlab=" ",ylab="Energy Sub Metering",pch="."),
     plot(datetime,Sub_metering_3,xlab=" ",ylab="Energy Sub Metering",pch="."))
lines(datetime,new_data$Sub_metering_1,col="black")
lines(datetime,new_data$Sub_metering_2,col="red")
lines(datetime,new_data$Sub_metering_3,col="blue")

# Plotting the 3rd graph 
Voltage <- as.numeric(new_data$Voltage)
with(new_data,plot(datetime,Voltage,pch="."))
lines(datetime,Voltage)

# Plotting the 4th graph 
Global_reactive_power <- as.numeric(new_data$Global_reactive_power)
with(new_data,plot(datetime,Global_reactive_power,pch="."))
lines(datetime,Global_reactive_power)

mtext("Final Set of Graphs",outer=TRUE)
### Step 3 : Copy to a png file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()