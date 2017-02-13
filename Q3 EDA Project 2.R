
# Question3:
# Of the four types of sources
# indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen 
# increases in emissions from 1999–2008? Use the ggplot2 plotting
# system to make a plot answer this question.

# Get ggplot
library(ggplot2)

sub2 <- subset(NEI, fips == "24510")

balt.sources <- aggregate(sub2[c("Emissions")],
                  list(type = sub2$type, year = sub2$year), sum)

qplot(year, Emissions, data = balt.sources,
      color = type, geom= "line")+
  ggtitle(
    "Total PM2.5 Emissions in Baltimore County by Source Type"
    ) + xlab("Year") + ylab("PM2.5 Emissions")          
