#####################################################################
#Plot 3 : Line plots for each of the type of emissions
## Question ##
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
## Result ## 
# Except for Point everything else has a decrease in emission levels
#####################################################################

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

str(summarySCC_PM25_baltimore)

agg <- aggregate(Emissions ~ year + type, summarySCC_PM25_baltimore,sum)

g <- ggplot(agg, aes(year, Emissions,col= type))
g <- g + geom_line() +
  xlab("Emission Years") +
  ylab(expression("Total PM Emissions")) +
  ggtitle("Total Emissions in Baltimore City")
print(g)


### Step 3 : Copy to a png file
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()


