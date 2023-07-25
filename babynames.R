require('ggplot2')
require('dplyr')
require('arules')
require('arulesViz')

babys = read.csv("C:/Users/NGY/Desktop/2023/Rstudy/Popular_Baby_Names.csv")

summary(babys)
class(babys)
# R은 order이라는 자체 정렬함수를 가지고있다. 혹은 dpylr에 있는 arrange 함수로 하면 될듯
nbabys = babys[ order(babys$Rank, decreasing = TRUE), ]
#plot(nbabys)

nbabys %>% filter(if_any()) %>% ggplot(nbabys, aes(x = Ethnicity, y = Count, col = Gender)) + geom_point()
ggplot(nbabys, aes(x = Ethnicity, y = Rank, col = Gender)) + geom_count()

#데이터들의 결측값이 얼마나 있는지 보여줌
colSums(is.na(nbabys))
