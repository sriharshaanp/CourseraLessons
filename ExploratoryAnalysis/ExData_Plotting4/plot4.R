############################################################################
#PLot 4 : Line plot for emissions from 1999 to 2008 for coal based emissions
## Question ##
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
## Result ##
# There is sharp decrease in the total emissions
############################################################################

### Step 1 : Do some housekeeping 
plot.new();

rm(list=ls())
rm(list=lsf.str()) # Remove all functions without removing the variables

library(ggplot2)

## Read the files 

setwd("C:/Users/esrihan/Documents/Learning_new/Coursera/ExploratoryAnalysis/ExData_Plotting3")
summarySCC_PM25 = readRDS("./exdata-data/summarySCC_PM25.rds")
Source_Classification_Code = readRDS("./exdata-data/Source_Classification_Code.rds")

str(Source_Classification_Code)
names(Source_Classification_Code)


Source_Classification_Code_new <- Source_Classification_Code[grep("coal", Source_Classification_Code$Short.Name, ignore.case=TRUE),]

table(Source_Classification_Code_new$Short.Name)

mergedData <- merge(summarySCC_PM25, Source_Classification_Code_new, by="SCC")

agg <- aggregate(Emissions ~ year, mergedData,sum)

#barplot(height=agg$Emissions, 
#        names.arg = agg$year,
#        xlab="years", ylab=expression('Aggregated emission levels'),
#        main=expression('Total emissions during from 1999 to 2008 for coal based combustion'))


g <- ggplot(agg, aes(year, Emissions))
g <- g + geom_line() +
  xlab("Emission Years") +
  ylab(expression("Total Emissions")) +
  ggtitle("Total Emissions from 1999 to 2008 for coal based combustion")
print(g)

### Step 3 : Copy to a png file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()