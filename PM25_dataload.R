#Load in data
install.packages("downloader")
library(downloader)
require(downloader)

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
findata <- with(NEI, aggregate(Emissions, by = list(year), sum))

# Run some quick checks on data
summary(findata)
str(findata)
head(findata)
# Make the numbers more readable- in millions divide out
findata$x <- findata$x/1000000

# Questions

# You must address the following questions and tasks in 
# your exploratory analysis. For each question/task you
# will need to make a single plot. Unless specified,
# you can use any plotting system in R to make your plot.

#1.)Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#2.)Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#3.)Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
#4.)Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#5.)How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#6.)Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?