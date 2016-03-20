# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetBaltimoreNEI  <- NEI[NEI$fips=="24510", ]


BaltimoreEmissionTotalByYear <- aggregate(Emissions ~ year, subsetBaltimoreNEI, sum)

png('plot2.png')
barplot(height=BaltimoreEmissionTotalByYear$Emissions, names.arg=BaltimoreEmissionTotalByYear$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=
          expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
