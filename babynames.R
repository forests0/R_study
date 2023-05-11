require('ggplot2')
require('dplyr')
require('arules')
require('arulesViz')

babys = read.csv("C:/Users/NGY/Desktop/2023/Rstudy/Popular_Baby_Names.csv")
babys

summary(babys)
class(babys)
# R은 order이라는 자체 정렬함수를 가지고있다. 혹은 dpylr에 있는 arrange 함수로 하면 될듯
nbabys = babys[ order(babys$Rank, decreasing = TRUE), ]
#plot(nbabys)

ggplot(nbabys, aes(x = Ethnicity, y = Count, col = Gender)) + geom_point()
ggplot(nbabys, aes(x = Rank, y = Year.of.Birth, col = Gender)) + geom_point()

is.na(nbabys)
