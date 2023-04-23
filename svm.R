# SVM (Support Vector Machine)

install.packages('e1071')
install.packages('class')
install.packages('caret')

require('ggplot2')
require('gapminder')
require('dplyr')
require('e1071')
require('caret')
require('class')

s = svm(Species ~ ., data = iris)
print(s)

table(predict(s, iris), iris$Species)

s = svm(Species ~ ., data = iris, kernel = 'polynomial') # polynomial 커널 함수 사용해봄
p = predict(s, iris)
table(p, iris$Species) # 성능이 떨어지는 것을 보아 다른 것을 사용하는 것이 좋을듯

s = svm(Species ~ ., data = iris, cost = 100) # 기본 커널은 radial basis
p = predict(s, iris)
table(p, iris$Species)

train = iris
test = data.frame(Sepal.Length = c(5.11,7.01,6.32), Sepal.Width = c(3.51,3.2,3.31), Petal.Width = c(1.4,4.71,6.02), Petal.Length = c(0.19,1.4,2.49))
k = knn(train[, 1:4], test , train$Species, k = 5) 
k

r = train(Species ~ ., data = iris, method = 'rpart')
f = train(Species ~ ., data = iris, method = 'rf')
s = train(Species ~ ., data = iris, method = 'svmRadial')
k = train(Species ~ ., data = iris, method = 'knn')

names(getModelInfo())
