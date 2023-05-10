require('ggplot2')
require('dplyr')
require('arules')
require('arulesViz')

babys = read.csv("C:/Users/NGY/Desktop/2023/Rstudy/Popular_Baby_Names.csv")
babys

summary(babys)
sort(babys)
class(babys)
# R은 order이라는 자체 정렬함수를 가지고있다. 혹은 dpylr에 있는 arrange 함수로 하면 될듯
nbabys = babys[ order(babys$Rank, decreasing = TRUE), ]

plot(nbabys)

help('gapminder')
??gapminder

nbabys %>% filter(Year.of.Birth == 2015) %>% ggplot(nbabys, aes(x = Year.of.Birth, y = Count, col = Gender)) + geom_point()
