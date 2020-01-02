##Of the four types(point, nonpoint, onroad, nonroad) variable, which of the source
##Q1: have seen decrease in emissions from 1999 - 2008 for Baltimore City
##Q2: Which have seen increase in emissions

library("dplyr")
library("ggplot2")

# PM2.5 for Baltimore, Maryland

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

# Calling out Year-wise sum for Baltimore, Maryland

NEI_Baltimore <- filter(NEI, NEI$fips == 24510)

g <- ggplot(NEI_Baltimore,aes(factor(year),Emissions,fill=type))
g + geom_bar(stat = "identity") + facet_grid(.~type, scales = "free", space = "free") + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
