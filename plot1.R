
library("lattice")
library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

# Calling out Year-wise sum
YearlyEmissions <- tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE)

#Seeing data
YearlyEmissions

YearlyEmissions <- as.numeric(YearlyEmissions)
YEAR <- c(1999, 2002, 2005, 2008)

# Barplot 
png(filename='plot1.png')
barplot(YearlyEmissions, names = YEAR, xlab = "Years", 
        ylab = expression("Total tonnes of PM"[2.5]*" Emissions"), 
        main = expression("Annual PM"[2.5]*" Emissions in US"))

#conclusion: Yes, the PM2.5 Emissions over the years decresead!

