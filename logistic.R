#로지스틱 회귀 적용시켜볼거임
#library 적용 다 시켜줘야됨. 안시켜주니깐 안되는게 좀 많음

library(gapminder)
library(dplyr)
library(survival)
library(ggplot2)
str(colon)
plot(colon)
library(gridExtra)
#이걸 써도 똑같이 적용되는거 같으니, 다음부터는 require 로 사용해보자.
require('dplyr')

#변수쌍을 만들어서 status과의 관계를 유추해볼 예정
p1 = colon %>% ggplot(aes(extent, status)) + geom_jitter(aes(col = factor(status)), height = 0.1, width=0.1)
p2 = colon %>% ggplot(aes(age, status)) + geom_jitter(aes(col = factor(status)), height = 0.1, width=0.1)
p3 = colon %>% ggplot(aes(sex, status)) + geom_jitter(aes(col = factor(status)), height = 0.1, width=0.1)
p4 = colon %>% ggplot(aes(nodes, status)) + geom_jitter(aes(col = factor(status)), height = 0.1, width=0.1)

grid.arrange(p1,p2,p3,p4, ncol = 2, nrow = 2)
# extent가 많은수록 status 가 1인 경우가 많고, age는 큰 상관 없는 것으로 보임
# sex 또한 딱히 큰 상관 없어보이고, nodes 수는 많을수록 status가 1인 것을 추측 가능한 정도

m = glm(status ~., data = colon, family = binomial)
m

table(is.na(colon)) # 위의 m 에서 보았듯이, 결측치 82개가 있음

colon2 = na.omit(colon)
m = glm(status ~ ., data = colon2, family = binomial)
m #결측치를 제거하고 한 결과. study 가 모두 같은 값을 가지고 있다고 추측 가능함

colon2 = colon2[c(TRUE, FALSE), ]
m = glm(status ~ ., data = colon2, family = binomial)
m # etype 이라는 변수는 2와 1만 있기 때문에 1만 추출해서 함.
#주의할 점은, 우리가 최종적으로 생존 / 죽음을 예측하는 것이기 때문에 time 값은 매우 중요한 값임
#이 값을 포함시키고 하면 매우 쉬운 분류 문제가 되어버린다.
