#######################################################
#PLot 1 : Simple histogram of the Global Activity Power
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
Global_active_power <- as.numeric(new_data$Global_active_power);

hist(Global_active_power,col="red",xlab="Global Active Power (kilowatt)",main = "Global Active Power")


### Step 3 : Copy to a png file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()