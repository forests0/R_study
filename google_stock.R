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
#그렇다면 데이터들을 2020 이후로 줄여서 본다면 어떨까?
stock_monthly %>% filter(Date >= as.Date("2020-01-01")) %>% ggplot(aes(x = Date, y =Price, col = High)) + geom_point()
#x를 Date로 해놓은 뒤, 가격을 col에 놓는 것이 내가 원하는 결과
stock_monthly %>% filter(Date >= as.Date("2020-01-01")) %>% ggplot(aes(x = Date, y =Price, col = Low)) + geom_point()
#이렇게 보니 2022년 코로나로 인한 급격한 상승 이후로 감소세를 보이는 것을 알 수 있음.
ggplot(stock_monthly, aes(x = Date, y = Close, col = High)) + geom_point() + geom_abline(intercept = 0, slope = 1, color = "red")
# 2018-2020년대(비트코인 등이 흥했을 시절)에는 어떤 변화가 있을까
stock_monthly %>% filter(Date >= as.Date('2018-01-01') & Date <= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Close, col = High)) + geom_point()
#그렇다면 2020년 이전의 양들을 보자.
stock_monthly %>% filter(Date <= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Volume)) + geom_point() + scale_y_log10()
#그래도 색상 구분을 해주면 설명을 할 때 더 도움이 될 듯
stock_monthly %>% filter(Date <= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Volume, col = High)) + geom_point() + scale_y_log10()
stock_monthly %>% filter(Date <= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Price, col = High)) + geom_point() + scale_y_log10()
#2020년도 이후로 보면 코로나 시절 (2021-2022) 때가 가장 High가 높고 Volume도 꾸준한 편
#코로나가 시장에 얼마나 큰 영향을 미쳤는지 알 수 있는 부분일듯.
stock_monthly %>% filter(Date >= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Volume, col = High)) + geom_point() + scale_y_log10()
#Price로 보니 코로나때 얼마나 증가했는지 알수있는듯. 더 정확하다고 생각.
stock_monthly %>% filter(Date >= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Price, col = High)) + geom_point() + scale_y_log10()
stock_monthly %>% filter(Date >= as.Date('2020-01-01')) %>% ggplot(aes(x = Date, y = Price, col = Low)) + geom_point() + scale_y_log10()
#geom_point()말고 다른 plot을 사용하려면 어떤 plot이 좋을까
ggplot(stock_monthly, aes(x = Date, y = Price)) + geom_spoke(angle = 60, radius = 0.3) + scale_y_log10()
ggplot(stock_monthly, aes(y = Price, col = Date)) + geom_histogram()
ggplot(stock_monthly, aes(x = Date, y = Price,)) + geom_polygon()
