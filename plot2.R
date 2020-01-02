install.packages"dplyr"

library("dplyr")
# PM2.5 for Baltimore, Maryland

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

# Calling out Year-wise sum for Baltimore, Maryland

NEI_Baltimore <- filter(NEI, NEI$fips == 24510)

BaltimoreEmissions <- tapply(NEI_Baltimore$Emissions, 
                             NEI_Baltimore$year, sum, na.rm = TRUE)
BaltimoreEmissions

#Plotting

YEAR <- c(1999, 2002, 2005, 2008)

# Barplot 
png(filename = plot2.png)
barplot(BaltimoreEmissions, names = YEAR, xlab = "Years", 
        ylab = expression("Total tonnes of PM"[2.5]*" Emissions"), 
        main = expression("Annual PM"[2.5]*" Emissions in Baltimore, Maryland"))

#conclusion: It increased from 2002 - 2005 but overall it decreased from 1999.

dev.off()
