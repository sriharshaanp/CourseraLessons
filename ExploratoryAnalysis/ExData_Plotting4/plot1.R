#####################################################################
#Plot 1 : Bar plot of Total Emissions during 1999,2002,2005 and 2008
## Question ##
# Have total emissions from PM2.5 decreased in the 
# United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for 
# each of the years 1999, 2002, 2005, and 2008 ?
## Result ## 
# From the barplot it is very clear that 
# there is a decrease in the emission levels.
#####################################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables


## Read the files 

setwd("C:/Users/esrihan/Documents/Learning_new/Coursera/ExploratoryAnalysis/ExData_Plotting3")
summarySCC_PM25 = readRDS("./exdata-data/summarySCC_PM25.rds")
Source_Classification_Code = readRDS("./exdata-data/Source_Classification_Code.rds")

summarySCC_PM25_new <- summarySCC_PM25[summarySCC_PM25$year %in% c("1999", "2002", "2005", "2008"),]

agg <- aggregate(Emissions ~ year, summarySCC_PM25_new,sum)

barplot(height=agg$Emissions, 
        names.arg = agg$year,
        xlab="years", ylab=expression('Total emission levels'),
        main=expression('Total emissions during 1999, 2002, 2005, 2008'),
        col=c("red","blue","green","yellow"))

### Step 3 : Copy to a png file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

