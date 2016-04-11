###########################################################################
#PLot 1 : Line plot of the Total Emissions in Baltimore City VS Los Angeles
## Question ##
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
## Result ##
# Los Angeles has a drastic change as seen by the line plot
###########################################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables

library(ggplot2)

## Read the files 

setwd("C:/Users/esrihan/Documents/Learning_new/Coursera/ExploratoryAnalysis/ExData_Plotting3")
summarySCC_PM25 = readRDS("./exdata-data/summarySCC_PM25.rds")
Source_Classification_Code = readRDS("./exdata-data/Source_Classification_Code.rds")

summarySCC_PM25_baltimore <- summarySCC_PM25[summarySCC_PM25$fips %in% c("24510","06037"),]

summarySCC_PM25_baltimore$fips[summarySCC_PM25_baltimore$fips%in%"24510"] <-"Baltimore,MD"
summarySCC_PM25_baltimore$fips[summarySCC_PM25_baltimore$fips%in%"06037"] <-"Los Angeles,CA"
## Baltimore with no non-road type emissions
summarySCC_PM25_baltimore <- summarySCC_PM25_baltimore[!(summarySCC_PM25_baltimore$type %in% c("NON-ROAD")),]

str(summarySCC_PM25_baltimore)

agg <- aggregate(Emissions ~ year + fips, summarySCC_PM25_baltimore,sum)

g <- ggplot(agg, aes(year, Emissions,col= fips))
g <- g + geom_line() +
  xlab("Emission Years") +
  ylab(expression("Total Emissions")) +
  ggtitle("Total Emissions in Baltimore City VS Los Angeles for motor vehicles")
print(g)

### Step 3 : Copy to a png file
dev.copy(png,file="plot6.png",width=480,height=480)
dev.off()
