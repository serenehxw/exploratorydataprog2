NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#########################################################################################
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?#
#########################################################################################

#Subset Motor Vehicles, assume is anything like Motor Vehicle in SCC.Level.Two.
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Subset Baltimore City
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]

#Bar chart with scaling
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

## Saving to file
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
