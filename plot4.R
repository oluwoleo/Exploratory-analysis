#set the working directory
setwd("C:/Users/Oluwoleo/Desktop/self training/Data Science Track/exdata-data-NEI_data")

#'Download the National Emissions Inventory (NEI) data from the Coursera website into your working directory
#You can read each of the two files using the readRDS() function in R as long as each of those files is in your current working directory . 
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 4 
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# merge the two data sets 
  NEISCC <- merge(NEI, SCC, by="SCC")

  # load the ggplot library 
library(ggplot2)
  


# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()