#일반화 선형 모형을 만들기 위함
muffler = data.frame(discount = c(2.0,4.0,6.0,8.0,10.0), profit = c(0,0,1,1,1))
plot(muffler, pch = 20, cex = 2, xlim = c(0,12))s
m = lm(profit ~ discount, data = muffler)
summary(m)

#이렇게 학습을 시킨 것에 잘못된 데이터를 넣으면 결과가 좋게 나오지 않음.
#그렇기 때문에 일반화 선형 모형을 사용해서 해결하려 하는 것.
newd = data.frame(discount = c(1,5,12,20,30))
p = predict(m, newd)

plot(muffler, pch = 20, xlim = c(0, 32), ylim = c(-0.5, 4.2))
abline(m)
res = data.frame(discount = newd, profit = p)
points(res, pch = 20, cex = 2, col = 'magenta')
legend('bottomright', legend = c('train data', 'new data'), pch = c(20, 20), cex = 2, col = c('black', 'red'), bg = 'gray')

#일반화 선형 모델을 활용하면 데이터가 비정규 분포를 가질 수 있게 된다는 장점을 가지고 있음

haberman = read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data', header = FALSE)
names(haberman) = c('age', 'op_year', 'no_nodes', 'survival')
str(haberman)
haberman$survival = factor(haberman$survival) # survival의 값을 범주형으로 변경
h = glm(survival ~ age + op_year + no_nodes, data = haberman, family = binomial)
deviance(h) #오차 계산

newp = data.frame(age = c(37,66), op_year = c(58,60), no_nodes=c(5,32)) # 새로운 환자를 넣어 학습한 것을 테스트해봄
predict(h, newdata = newp, type = 'response')

nh =  glm(survival ~ age + no_nodes, data = haberman, family = binomial) # 필요없어보이는 데이터를 빼는 선택을 함
deviance(nh) # 그러나 큰 변화가 없는 것을 보아 특징 선택을 하지 않아도 될듯

newp2 = data.frame(age = c(37,66), no_nodes=c(5,32))
predict(nh, newdata = newp2, type = 'response') #결과
