library(dplyr)
library(ggplot2)

airbnb = read.csv("C:/Users/NGY/Desktop/2023/Rstudy/Listings.csv")
head(airbnb, 5)
#결측치 확인
colSums(is.na(airbnb))
airbnb$bedrooms[is.na(airbnb$bedrooms)] <- 0
airbnb$host_total_listings_count[is.na(airbnb$host_total_listings_count)] <- 0
airbnb = na.omit(airbnb)

summary(airbnb)
mean(airbnb$price)

airbnb %>% ggplot() + geom_point(aes(x = price, y = bedrooms), color = "blue", size = 1.5, shape = 16, alpha = 0.5)
airbnb %>% ggplot() + geom_histogram(aes(x = ))
