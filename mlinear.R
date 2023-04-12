install.packages("scatterplot3d")
library(scatterplot3d)
library()

# scatterplot3d를 이용해서 3차원 데이터를 시각화 할 수도 있음
x = c(3.0,6.0,3.0,6.0)
y = c(10.0,10.0,20.0,20.0)
z = c(4.65,5.9,6.7,8.02)
scatterplot3d(x,y,z, xlim = 2:7, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h')

m = lm(z ~ x + y) # 다중 선형 회귀를 적용시키려면 두 값을 합친 상태로 학습한다
coef(m)

s = scatterplot3d(x,y,z, xlim = 2:7, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h')
s$plane3d(m) # 데이터에 학습한 모델을 적용하여 시각화

fitted(m)
residuals(m)
deviance(m)
deviance(m) / length(x)

#새로운 데이터들에 대한 예측을 적용시킴
nx = c(7.5,5.0)
ny = c(15.0, 12.0)
new_data = data.frame(x = nx, y = ny)
nz = predict(m, new_data)
nz

# 새로운 데이터들의 예측 결과
s = scatterplot3d(nx,ny,nz, xlim = 1:10, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h', color = 'blue', angle = 60)
s$plane3d(m)

?trees

#실습 ; 벚나무의 둘레 예측
summary(trees)

plot(Volume ~ Girth, data = trees, log = "xy")

scatterplot3d(trees$Girth, trees$Height, trees$Volume, angle = 30)

m = lm(Volume ~ Girth + Height, data = trees)
m


s = scatterplot3d(trees$Girth, trees$Height, trees$Volume, pch = 20, type = 'h', angle = 55)
s$plane3d(m)

ndata = data.frame(Girth = c(8.5, 13.0, 19.0), Height = c(72,83,85))
predict(m, newdata = ndata)

