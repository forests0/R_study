install.packages("gapminder")
install.packages("dplyr")

library(gapminder)
library(dplyr)

#뭐든지 설치 후 library 화 시키자.
glimpse(gapminder)
as.data.frame(gapminder)

#앞에 , 붙이는 이유는 행으로 정렬되어있으면 보기 불편하기에 열로 정렬하여 보는 것임
gapminder[,c('country', 'lifeExp')]

gapminder[gapminder$country == 'Croatia', ]

gapminder[gapminder$country == 'Croatia', "gdpPercap"]

#select를 이용해서 특정 속성을 꺼내올 수 있음
select(gapminder, country, year, lifeExp)

#filter을 씌워서 속성의 일부만을 꺼내올 수 있음. 위보다 간단함
filter(gapminder, country=='Croatia')

#이처럼 group_by를 사용하면 전체 데이터를 그룹화 해서 정리할 수 있음
summarise(group_by(gapminder, continent), pop_avg = mean(pop))

#변수를 여러번 선언해서 그것을 안에 넣는 방법도 있지만
# %>%
#을 사용해서 한번에 할 수있음
