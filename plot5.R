#set the working directory
setwd("C:/Users/Oluwoleo/Desktop/self training/Data Science Track/exdata-data-NEI_data")

#'Download the National Emissions Inventory (NEI) data from the Coursera website into your working directory
#You can read each of the two files using the readRDS() function in R as long as each of those files is in your current working directory . 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#Question 5 
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetBaltimoreNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalBaltimoreByYear <- aggregate(Emissions ~ year, subsetBaltimoreNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalBaltimoreByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()