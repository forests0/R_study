# 의사결정트리 함수

install.packages('rpart')
install.packages('rpart.plot')
install.packages('party')

require('gapminder')
require('dplyr')
require('survival')
require('ggplot2')
require('rpart')
require('rpart.plot')
require('party')

t = read.csv('C:/Users/NGY/Desktop/2023/Rstudy/ex_resident.csv')
t

c = rpart(Species ~ ., data = iris)
c

plot(c, compress=T, margin=0.3) # 의사결정트리도 plot 함수로 표현할 수 있음
text(c, cex=1.0) # 그 위에다가 text를 입힘 (없으면 텍스트 없음. 가지만 있음)

head(predict(c, newdata = iris, type = "class"))
tail(predict(c, newdata = iris, type = "class"))

prp(c, type = 4, extra = 2) # prp를 사용해서 시각화를 해주면 node에 해당하는 개체의 수를 알 수 있음

ls(c)
c$cptable

opt = which.min(c$cptable[, "xerror"])
cp = c$cptable[opt,"CP"]
prune.c = prune(c, cp=cp)
plot(prune.c)
text(prune.c) # 오차를 최소화하는 방향으로 다시 가지치기
plotcp(c) # 물론 해도 큰 변화는 일어나지 않음

data(stagec) # rpart 패키지에서 제공하는 데이터
str(stagec) # 전립선 암 환자의 자료

#결측치 제거
stagec1 = subset(stagec, !is.na(g2))
stagec2 = subset(stagec1, !is.na(gleason))
stagec3 = subset(stagec2, !is.na(eet))

set.seed(1)
#데이터를 학습 7, 테스트 3으로 구분하기 위해서 seed를 고정하고 prob를 0.7 : 0.3 으로 줌
ind = sample(2, nrow(stagec3), replace = TRUE, prob = c(0.7,0.3))

# 학습데이터와 테스트 데이터를 분리
trainData = stagec3[ind == 1,]
testData = stagec3[ind == 2,]

tree = ctree(ploidy ~ ., data=trainData)

plot(tree)

summary(c)
