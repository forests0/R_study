library(dplyr)
library(ggplot2)

stock_monthly <- read.csv('C:/Users/NGY/Desktop/2023/Rstudy/google-stock-dataset-Monthly.csv')
stock_weekly <- read.csv('C:/Users/NGY/Desktop/2023/Rstudy/google-stock-dataset-Weekly.csv')
colSums(is.na(stock_weekly))
colSums(is.na(stock_monthly)) # NA 값이 없음.
stock_monthly$Date <- as.Date(stock_monthly$Date)
stock_weekly$Date <- as.Date(stock_weekly$Date)

#날짜에 따른 최대 가격
ggplot(stock_monthly, aes(x = High, y =Price, col = Date)) + geom_point()
#같은 논지로 최소 가격 또한 올라가는중
ggplot(stock_monthly, aes(x = Low, y =Price, col = Date)) + geom_point()
#가격대 변화를 boxplot으로 체크
ggplot(stock_monthly, aes(x = Price)) + geom_boxplot()
#volume(총 거래량으로 추측) 을 Date와 같이 violin으로 보는중
ggplot(stock_monthly, aes(x = Date, y = Volume)) + geom_violin() + scale_y_log10()
filtered_dates <- stock_monthly[stock_monthly$Date >= as.Date("2020-01-01")]
