plot(women)

plot(cars, col='blue', xlab='속도',ylab = '거리')

plot(iris, col='black')

tips = read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
str(tips)

head(tips,10)

summary(tips)
# 여기는 shape 대신 summary 라는 요약함수가 있음 ----


summary(iris)

a = c(1:10)
a

b = seq(from = 1, to = 39, by = 3)
b[1]
# 여기서 배열은 0번 시작이 아니라 1번 시작 ----
any(b > 6)
all(b / 3 == 1)
# any와 all 또한 조건문이라서 == 을 사용함

head(b, 3)

c = array(1:6,c(4,2))
#array 함수는 array(벡터 데이터, 차원 정의)로 사용할 수 있음
c
