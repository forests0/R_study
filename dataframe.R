name = c('이름1','이름2','이름3')
age = c(32,41,12)
gender = factor(c('M','F','M'))
blood.type = factor(c('A','O','B'))
#변수 이름에 .가 들어가도 된다

patients = data.frame(name,age,gender,blood.type)

patients

patients[,2]
patients[3,]

head(cars)

#속성 변수화(변수 이름은 속성의 이름 그대로)
attach(cars)

dist
#속성 변수화 해제
detach(cars)

#with 함수를 이용해 수학적 함수들을 편하게 사용할 수 있음
with(cars,mean(speed))

#subset을 이용해 특정한 속성만 뽑아낼 수 있음
#이 때, select 변수 쪽 c가 -c라면 특정한 속성을 제외하고 뽑을 수 있음
subset(cars, dist > 50, select=c(dist))

#na.omit을 사용하면 NA 값을 제외하고 사용할 수 있음
head(na.omit(airquality))

#table을 사용해서 수를 테이블화시킴
table(is.na(airquality))


