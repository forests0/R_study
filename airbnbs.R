library(dplyr)
library(ggplot2)

airbnb = read.csv("C:/Users/NGY/Desktop/2023/Rstudy/Listings.csv")
head(airbnb, 5)
#결측치 확인 / 가공공
colSums(is.na(airbnb))
airbnb$bedrooms[is.na(airbnb$bedrooms)] <- 0
airbnb$host_total_listings_count[is.na(airbnb$host_total_listings_count)] <- 0
airbnb$host_response_rate[is.na(airbnb$host_response_rate)] <- 0
airbnb$host_acceptance_rate[is.na(airbnb$host_acceptance_rate)] <- 0
airbnb = na.omit(airbnb)
nrow(airbnb) # 187828

summary(airbnb)
filtered_bedroom <- airbnb %>% filter(bedrooms > 5)

ggplot(airbnb) + geom_point(aes(x = review_scores_rating , y = price, col = room_type), size = 1.5, shape = 16, alpha = 0.5)
ggplot(airbnb, aes(x = bedrooms, col = room_type)) + geom_histogram()
ggplot(airbnb, aes(x =review_scores_rating, y = review_scores_accuracy)) + geom_point()
