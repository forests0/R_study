library(dplyr)
library(ggplot2)

stock_monthly <- read.csv('C:/Users/NGY/Desktop/2023/Rstudy/google-stock-dataset-Monthly.csv')
stock_weekly <- read.csv('C:/Users/NGY/Desktop/2023/Rstudy/google-stock-dataset-Weekly.csv')
colSums(is.na(stock_weekly))
colSums(is.na(stock_monthly)) # NA 값이 없음.
stock_monthly$Date <- as.Date(stock_monthly$Date)
stock_weekly$Date <- as.Date(stock_weekly$Date)

ggplot(stock_monthly, aes(x = High, y = )) + geom_bar()

