require('caret')
require('rpart')
require('rpart.plot')
require('randomForest')

r = rpart(Species ~ ., data = iris)
f = randomForest(Species ~., data = iris, ntree = 3)
rpred = predict(r, iris, type = 'class')
fpred = predict(f, iris)

confusionMatrix(rpred, iris$Species) # rpart로 정확률 측정한 것. 행열이 모두 똑같은 것이 정답.
confusionMatrix(fpred, iris$Species) # randomforest 로 한 것, 정확률은 randomforest가 더 높음

#그렇다면 iris 데이터를 가공할 때에는 randomforest를 사용하는 것이 좋음.

n = nrow(iris)
i = i:n
trainlist = sample(i, n * 0.7) # 60% 를 학습 데이터로 넣고, 랜덤하게 섞음
# 60 -> 70으로 수정했는데, 정확도가 조금 오르는 것을 보면 7 : 3 이 가장 최선의 결과를 내기에 좋은 것 같음.
testlist = setdiff(i, trainlist) # 나머지를 테스트 데이터로 넣기
iris_train = iris[trainlist, ] # 훈련 집합 추출
iris_test = iris[testlist, ] # 테스트 집합 추출

f = randomForest(Species ~ ., data = iris_train) # 훈련 집합으로 랜덤 포레스트 학습
p = predict(f, newdata = iris_test) # 테스트 집합으로 예측
p
iris_test$Species

tlist = createDataPartition(y = iris$Species, p = 0.6, list = FALSE) # carot으로 구현하면 더 쉽게 가능
itrain = iris[tlist, ]
itest = iris[-tlist, ]
f = randomForest(Species ~ ., data = itrain)
p = predict(f, newdata = itest)
p

con = trainControl(method = 'cv', number = 5) # trainControl 을 써서 k겹 교차검증을 쉽게 구현 가능
f = train(Species ~ ., data = iris, method = 'rf', metric = 'Accuracy', trControl = con)
confusionMatrix(f) # confusionMatrix를 사용해서 정확도를 편하게 볼 수 있음
