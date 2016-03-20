#set the working directory
setwd("C:/Users/Oluwoleo/Desktop/self training/Data Science Track/exdata-data-NEI_data")

#'Download the National Emissions Inventory (NEI) data from the Coursera website into your working directory
#You can read each of the two files using the readRDS() function in R as long as each of those files is in your current working directory . 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
subsetBaltimoreNEI  <- NEI[NEI$fips=="24510", ]

BaltimoreTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetBaltimoreNEI, sum)



png("plot3.png", width=640, height=480)
g <- ggplot(BaltimoreTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()