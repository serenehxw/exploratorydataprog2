#reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#################################################################################################################
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? #
#Use the base plotting system to make a plot answering this question.                                           #
#################################################################################################################

#Subset Baltimore City, Maryland (fips="24510")
baltimoreNEI <- NEI[NEI$fips=="24510",]

#Sum of Emissions
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

#Barplot
barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources", font.main=1
)

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=540)
dev.off()

