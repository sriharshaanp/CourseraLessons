###########################################################################
#PLot 2 : Total emissions for Baltimore City during  1999, 2002, 2005, 2008
## Question ## 
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
## Result ##
# From the barplot it is very clear that 
# there is a decrease in the emission levels.
##########################################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables


## Read the files 

setwd("C:/Users/esrihan/Documents/Learning_new/Coursera/ExploratoryAnalysis/ExData_Plotting3")
summarySCC_PM25 = readRDS("./exdata-data/summarySCC_PM25.rds")
Source_Classification_Code = readRDS("./exdata-data/Source_Classification_Code.rds")

summarySCC_PM25_baltimore <- summarySCC_PM25[summarySCC_PM25$fips == "24510",]

agg <- aggregate(Emissions ~ year, summarySCC_PM25_baltimore,sum)

barplot(height=agg$Emissions, 
        names.arg = agg$year,
        xlab="years", ylab=expression('Total emission levels'),
        main=expression('Total emissions for Baltimore City during  1999, 2002, 2005, 2008'),
        col=c("red","blue","green","yellow"))

### Step 3 : Copy to a png file
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()




