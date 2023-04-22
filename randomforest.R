install.packages('randomForest')

require('gapminder')
require('dplyr')
require('survival')
require('ggplot2')
require('rpart')
require('rpart.plot')
require('party')
require('randomForest')

#랜덤포레스트 함수
f = randomForest(Species ~ ., data = iris)
f

plot(f) # plot을 하면 가로축은 결정 트리의 개수, 세로축은 오류율을 나타냄.
# 파란색, 초록색, 빨간색이 각 versicolor, virginica, setosa의 오류율을 나타내며, 검은색의 그들의 평균이다.

varUsed(f)
varImpPlot(f) # 결정 트리가 질문에 활용한 횟수, 적을수록 중요도가 낮음을 보여줌

treesize(f) # 결정 트리 각각에 대한 리프 노드의 개수를 보여줌

newd = data.frame(Sepal.Length = c(5.11,7.01,6.32), Sepal.Width = c(3.51,3.2,3.31), Petal.Length = c(1.4,4.71,6.02), Petal.Width = c(0.19,1.4,2.49))
predict(f, newdata = newd) # 이렇게 한다면 수행 결과가 안나오기 때문에 불석읋 더 할 수 없음
predict(f, newdata = newd, type = 'prob') # 그래서 type을 붙여줘 인식을 할 수있게 함. prob을 붙이면 확률을 출력
predict(f, newdata = newd, type = 'vote', norm.votes = FALSE) # vote를 type으로 하면 얼마나 투표받았는지 알 수 있음

sforest = randomForest(Species ~ ., data = iris, ntree = 20, nodesize = 6, maxnodes = 12) 
treesize(sforest) 

sforest # 이것으로 정리된 것을 볼 수 있는데, 100 - error rate 하면 정확도 나옴

