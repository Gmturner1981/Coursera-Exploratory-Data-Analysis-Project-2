## Question 2

## Have total emissions from PM2.5 decreased in the
## United States from 1999 to 2008? Using the base
## plotting system, make a plot showing the total PM2.5
## emission from all sources for each of the years 1999,
## 2002, 2005, and 2008.

subbalt <- subset(NEI, fips == "24510")
str(subbalt)  ## Year showing as integer - need to make a data
summary(subbalt)
str(subbalt)
install.packages("zoo")
library(zoo)
subbalt$year1 <- as.factor(subbalt$year)
baltimore <- tapply(subbalt$Emissions,  subbalt$year1, sum)
str(baltimore)
summary(baltimore)
plot(baltimore, type = "o", main = "Total PM2.5 Emissions in Baltimore County",
     xlab = "Year1", ylab = "PM2.5 Emissions",
     pch = 18, col = "darkgreen", lty = 5)

## Yes - this has dropped from over 3200 to near 1800.  However,
## we did see a rise in 2005 (3.0 in the graph)
