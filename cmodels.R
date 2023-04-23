require('gapminder')
require('dplyr')
require('survival')
require('ggplot2')
require('rpart')
require('rpart.plot')
require('party')
require('randomForest')

ucla = read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
str(ucla)

ucla$admit = factor(ucla$admit) # 실습 자료 중 admit 은 범주형으로 전환
r = rpart(admit ~ ., data = ucla) # rpart를 사용해 트리 구조로 보기
par(mfrow = c(1,1), xpd = NA)
plot(r)
text(r, use.n = TRUE)

p = predict(r, ucla, type = 'class') # 위 개체들을 통해 예측
table(p, ucla$admit) # 결과는 (0,0)과 (1,1) 인것들의 확률을 구하면 80%정도

f = randomForest(admit ~ ., data = ucla)
f

colon2 = na.omit(colon) # 이번에는 colon 데이터를 랜덤포레스트를 적용해서 봄
colon2 = colon2[c(TRUE, FALSE), ]
colon2$status = factor(colon2$status)
str(colon2)
r = rpart(status ~ rx + sex + age + obstruct + perfor + adhere + nodes + differ + extent + surg + node4, data =colon2)
p = predict(r, colon2, type = 'class')
table(p, colon2$status)
plot(r)
text(r, use.n = FALSE)
summary(r)

# 이 모든 학습들의 문제는 train 데이터가 test에도 사용된다는 점임
# train 데이터와 test 데이터를 구분해서 학습 / 테스트가 되어야 하는데 그러지 못함
# 그러면 이제 구분해서 해야함