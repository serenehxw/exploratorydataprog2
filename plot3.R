#reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#############################################################################################################################
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,                            #
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?                            #
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.#
#############################################################################################################################

library(ggplot2)

#Using the same subset of Blatimore City, plot the bar charts, change its theme, seperate the types and add in the labels
ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
