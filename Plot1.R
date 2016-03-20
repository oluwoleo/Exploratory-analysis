#set the working directory
#'Download the National Emissions Inventory (NEI) data from the Coursera website into your working directory
#You can read more information about the NEI at the EPA National Emissions Inventory web site.

#Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

##get the total emmision by year into a variable
TotalEmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

#plot the graph to answer the question 


png('plot1.png')
barplot(height=TotalEmissionsByYear$Emissions, names.arg=TotalEmissionsByYear$year,xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
