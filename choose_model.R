#최적 모델 선정하기 -> 모델 성능 평가
require('caret')
require('rpart')
require('rpart.plot')
require('randomForest')
require('kernlab')
require('survival')

con = trainControl(method = 'cv', number = 5)
r = train(Species ~ ., data = iris, method = 'rpart', metric = 'Accuracy', trControl = con)
f = train(Species ~ ., data = iris, method = 'rf', metric = 'Accuracy', trControl = con) 
s = train(Species ~ ., data = iris, method = 'svmRadial', metric = 'Accuracy', trControl = con) 
k = train(Species ~ ., data = iris, method = 'knn', metric = 'Accuracy', trControl = con)
resamp = resamples(list(dicisiontree = r, randomforest = f, svm = s, knn = k)) 
summary(resamp) # 결정트리, 랜덤포레스트, svm, knn 4개를 사용해 모델 성능 비교
sort(resamp, decreasing = TRUE)
dotplot(resamp) # 모든 모델의 성능을 시각화해서 보여줌
# 하이퍼매개변수 : 학습 모델에 성능을 결정할 수 있는 변수. -> 함수에 영향이 큰 변수

colon2 = na.omit(colon) # colon 데이터의 모델을 정하기 위해서 모델 성능 검사를 할 것임
colon2 = colon2[c(TRUE, FALSE), ]
colon2$status = factor(colon2$status)

con  =trainControl(method = 'cv', number = 10)
formular = status ~ rx + sex + age + obstruct + perfor + adhere + nodes + differ + extent + surg + node4
l = train(formular, data = colon2 , method = 'svmLinear', metric = 'Accuracy', trControl = con)
lw = train(formular, data = colon2 , method = 'svmLinearWeights', metric = 'Accuracy', trControl = con)
p = train(formular, data = colon2 , method = 'svmPoly', metric = 'Accuracy', trControl = con)
r = train(formular, data = colon2 , method = 'svmRadial', metric = 'Accuracy', trControl = con)
rw = train(formular, data = colon2 , method = 'svmRadialWeights', metric = 'Accuracy', trControl = con)
f100 = train(formular, data = colon2 , method = 'rf', ntree = 100, metric = 'Accuracy', trControl = con)
f300 = train(formular, data = colon2 , method = 'rf', ntree = 300, metric = 'Accuracy', trControl = con)
f500 = train(formular, data = colon2 , method = 'rf', ntree = 500, metric = 'Accuracy', trControl = con)
rp = train(formular, data = colon2 , method = 'rpart', metric = 'Accuracy', trControl = con)
k = train(formular, data = colon2 , method = 'knn', metric = 'Accuracy', trControl = con)
g = train(formular, data = colon2 , method = 'glm', metric = 'Accuracy', trControl = con)
resamp = resamples(list(선형 = l, 선형가중치 = lw, 다항식 = p, RBF = r,가중치 = rw, rf100 = f100, rf300 = f300, rf500 = f500, tree = rp, knn = k, glm = g))
summary(resamp) # 10종류의 모델을 비교해서 최선의 모델의 선정
sort(resamp, decreasing = TRUE) # 내림차순으로 정렬
dotplot(resamp)
