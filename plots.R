apply(anscombe, 2, mean)

library(gapminder)
library(dplyr)

y = gapminder %>% group_by(year,continent) %>% summarize(c_pop = sum(pop))

head(y, 3)

#plot을 이렇게 쓰면 됨
plot(y$year , y$c_pop)

#col 옵션을 이용해 색상을 변경해준다
plot(y$year , y$c_pop, col = y$continent)

#둘은 결과적으로는 같지만, 나중에 값이 많이 추가된다면 밑의 식처럼 해주는 것이 좋을듯
plot(y$year , y$c_pop, col = y$continent, pch = c(1:5))
plot(y$year , y$c_pop, col = y$continent, pch = c(1:length(levels(y$continent))))

#위에 범례 개수를 지정 (왼쪽 위)
legend('topleft', legend = 5, pch = c(1:5), col = c(1:5))
legend('topleft', legend = levels((y$continent)), pch = c(1:length(levels(y$continent))), col = c(1:length(levels(y$continent))))

plot(gapminder$gdpPercap, gapminder$lifeExp, col = gapminder$continent)
legend('bottomright', legend = levels((gapminder$continent)), pch = c(1:length(levels(gapminder$continent))), col = c(1:length(levels(gapminder$continent))))

#위 plot의 gdp 값이 너무 높았기 때문에, 보기 편하게 log10 을 해줌
plot(log10(gapminder$gdpPercap), gapminder$lifeExp, col = gapminder$continent)
legend('bottomright', legend = levels((gapminder$continent)), pch = c(1:length(levels(gapminder$continent))), col = c(1:length(levels(gapminder$continent))))

library(ggplot2)
#ggplot을 사용하면 일일이 함수 속성을 지정해줄 필요가 없는 장점이 있음
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) + geom_point() + scale_x_log10()

#추가로, point의 크기를 개수만큼 지정해줄 수 있음
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent, size=pop)) + geom_point() + scale_x_log10()

# 점의 겹침 문제도 투명도를 조절해 해결할 수 있음
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent, size = pop)) + geom_point(alpha = 0.5) + scale_x_log10()

#이것들을 구분할 수 있는 속성이 있다면 구분해서 볼 수도 있음
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent, size = pop)) + geom_point(alpha = 0.5) + scale_x_log10() + facet_wrap(~year)

# 1952년의 아시아 인구 분포 순위 (log를 씌워서 비율로 보는 것)
gapminder %>% filter(year==1952 & continent=='Asia') %>% ggplot(aes(reorder(country, pop), pop)) + geom_bar(stat='identity') + scale_y_log10() + coord_flip()

#대한민국의 국민 인구 상승도를 체크함
gapminder %>% filter(country=='Korea, Rep.') %>% ggplot(aes(year, lifeExp, col = country)) + geom_point() + geom_line()

#ggplot 으로 x축과 y축의 데이터를 정하고,  geom을 이용해 데이터를 어떻게 시각화할지 정해줄 수 있음 이라고 요약
gapminder %>% ggplot(aes(x = year, y = lifeExp, col = continent)) + geom_point(alpha = 0.2) + geom_smooth()

gapminder %>% ggplot(aes(x = continent, y = lifeExp, col = continent, size = pop)) + geom_point(alpha=0.5)

library(RColorBrewer)
#이걸 활용해서 그래프의 색을 다양하게 바꿀 수 있음. 색상 확인은 이렇게.
display.brewer.all()


