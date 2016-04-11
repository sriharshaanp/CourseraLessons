##################################################################################
#Plot 5 : Line plot of total emissions VS years for motor vehicles in Baltimore
## Question ##
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
## Result ## 
# the emissions decresed but near 2005 it spiked up again and then decreased again
##################################################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables

library(ggplot2)

## Read the files 

setwd("C:/Users/esrihan/Documents/Learning_new/Coursera/ExploratoryAnalysis/ExData_Plotting3")
summarySCC_PM25 = readRDS("./exdata-data/summarySCC_PM25.rds")
Source_Classification_Code = readRDS("./exdata-data/Source_Classification_Code.rds")

summarySCC_PM25_baltimore <- summarySCC_PM25[summarySCC_PM25$fips == "24510",]
summarySCC_PM25_baltimore$fips[summarySCC_PM25_baltimore$fips%in%"24510"] <-"Baltimore,MD"
## Baltimore with no non-road type emissions
summarySCC_PM25_baltimore <- summarySCC_PM25_baltimore[!(summarySCC_PM25_baltimore$type %in% c("NON-ROAD")),]

str(summarySCC_PM25_baltimore)

agg <- aggregate(Emissions ~ year, summarySCC_PM25_baltimore,sum)

g <- ggplot(agg, aes(year, Emissions))
g <- g + geom_line() +
  xlab("Emission Years") +
  ylab(expression("Total Emissions")) +
  ggtitle("Total Emissions for Motor Vehicles in Baltimore City")
print(g)

### Step 3 : Copy to a png file
dev.copy(png,file="plot5.png",width=480,height=480)
dev.off()