#####################################################################
#PLot 2 : Scatter plot of the Global Activity Power with the DateTime
#####################################################################

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

with(new_data,plot(datetime,Global_active_power,xlab=" ",ylab="Global Active Power (kilowatt)",pch="."))
lines(datetime,Global_active_power)

### Step 3 : Copy to a png file
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()