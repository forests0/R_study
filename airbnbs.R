library(dplyr)
library(ggplot2)
# Ctrl + L 이면 console Clear
airbnb = read.csv("C:/Users/NGY/Desktop/2023/Rstudy/Listings.csv")
head(airbnb, 5)
#결측치 확인 / 가공
airbnb$bedrooms[is.na(airbnb$bedrooms)] <- 0
airbnb$host_total_listings_count[is.na(airbnb$host_total_listings_count)] <- 0
airbnb$host_response_rate[is.na(airbnb$host_response_rate)] <- 0
airbnb$host_acceptance_rate[is.na(airbnb$host_acceptance_rate)] <- 0
airbnb = na.omit(airbnb)
colSums(is.na(airbnb))
nrow(airbnb) # 187828

summary(airbnb)
filtered_bedroom <- airbnb %>% filter(bedrooms > 5)

ggplot(airbnb) + geom_point(aes(x = review_scores_rating , y = price, col = room_type), size = 1.5, shape = 16, alpha = 0.5)
#침대 종류에 따른 개수를 보기 위함함
ggplot(airbnb, aes(x = bedrooms, col = room_type)) + geom_histogram()
#리뷰한 평점에 대한 신뢰도 검사, 결측치 재가공 전이나 후나 그렇게 큰 차이는 없어보임
ggplot(airbnb, aes(x =review_scores_rating, y = review_scores_accuracy)) + geom_point()
#위도, 경도에 따른 위치에 대한 평점이 궁금해서, 물론 지형이나 다른 점을 고려할 게 너무 많지만 주어진 정보가 이게 끝이라서 아쉽긴함.
ggplot(airbnb, aes(x = latitude, y = review_scores_location, col = longitude)) + geom_point(alpha = 0.3)
#청소에 관한 점수가 수용 인원에 영향을 받을까? 일단 room_type으로도 구분해서 본다. 물론 Entire place의 수가 매우 많음을 알고 가야하지만
ggplot(airbnb, aes(x = accommodates, y = review_scores_cleanliness, col = room_type)) + geom_point(alpha = 0.2)
#가격에 따른 리뷰 점수를 히트맵으로 표현해보려 했는데 count 해결을 해야함. <- 그대로 두는 것이 최선인듯.
# 수정할 수 있는 방법이 있지만 그러면 표가 크게 흐트러짐.
ggplot(airbnb, aes(x = price, y = review_scores_rating)) + xlim(1,55000) +geom_bin_2d(bins = 100) + scale_fill_gradient(low = "lightblue", high = "blue")
#도시에 따른 리뷰 점수 분포도가 궁금함. 보니 홍콩의 평균이 가장 낮음.
ggplot(airbnb, aes(x = city, y = review_scores_rating)) + geom_boxplot() + xlab('review_score') 
ggplot(airbnb, aes(x = city)) + geom_bar()


