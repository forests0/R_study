x = c(3.0,6.0,9.0,12.0) # feature
y = c(3.0,4.0,5.5,6.5) # target
#lm을 사용해서 학습을 할 수 있음
m = lm(y ~ x)
m

plot(x, y)
abline(m, col='blue')


coef(m) # 매개변수 값을 알려줌
fitted(m) # 샘플 예측값
residuals(m) # 잔차값
deviance(m) / length(x) # 잔차의 제곱합을 평균 제곱 오차로 변환하여 출력

summary(m) # 위 내용 요약

newx = data.frame(x = c(1.2,2.0,20.65))
predict(m , newdata = newx)

#실제 데이터에 적용
car_model = lm(dist ~ speed, data = cars)
summary(car_model)

plot(cars$dist, cars$speed)
coef(car_model)
abline(car_model, col='green')

nx1 = data.frame(speed = c(21.5))
predict (car_model, nx1)

nx2 = data.frame(speed = c(25.0,25.5,26.0,26.5,27.0,27.5,28.0))
predict(car_model, nx2)

nx = data.frame(speed = c(21.5,25.0,25.5,26.0,26.5,27.0,27.5,28.0))
plot(nx$speed, predict(car_model, nx), col = 'red', cex = 2, pch = 20)
abline(car_model)

#그래서 예측 결과와 학습된 모델의 선을 그은 것이 거의 일치한 것을 볼 수 있음

plot(cars, xlab = 'speed', ylab = 'dist')
x = seq(0, 25, length.out=200)
for(i in 1:4) {
  m = lm(dist ~ poly(speed, i), data = cars)
  assign(paste('m', i, sep = '.'), m)
  lines(x , predict(m, data.frame(speed=x)), col = i)
}

anova(m.1,m.2,m.3,m.4)
