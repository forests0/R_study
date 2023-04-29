install.packages('text2vec')

require('text2vec')
require('caret')
require('rpart')
require('randomForest')

str(movie_review)
head(movie_review)

tlist = createDataPartition(y = movie_review$sentiment, p = 0.6, list = FALSE) # carot으로 구현
mtrain = movie_review[tlist, ]
mtest = movie_review[-tlist, ]

doc = Corpus(VectorSource(mtrain$review))
doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removeWords, stopwords('english'))
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace) #전처리과정을 시켜주면 review에서 특정 단어만 뽑아낼 수 있음

dtm = DocumentTermMatrix(doc)
dim(dtm) # 그것을 정리해보면 이렇게 문장 전체가 단어 일부만으로 변한 모습을 볼 수 있음

str(dtm)
inspect(dtm)

dtms = removeSparseTerms(dtm, 0.9)
x = as.matrix(dtms)
datatrain = as.data.frame(cbind(mtrain$sentiment, x))
datatrain$V1 = as.factor(datatrain$V1)
colnames(datatrain)[1] ='y'
r = rpart(y ~ ., data = datatrain) # 훈련 데이터로 의사결정트리 학습
printcp(r)
par(mfrow = c(1,1), xpd = NA)
plot(r)
text(r, use.n = TRUE) # 최종 결과를 보면, 특정 단어를 바탕으로 다른 단어가 이어지는 모습을 볼 수 있음

f = randomForest(y ~ ., data = datatrain)

doctest = Corpus(VectorSource(mtest$review))
doctest = tm_map(doctest, content_transformer(tolower))
doctest = tm_map(doctest, removeNumbers)
doctest = tm_map(doctest, removeWords, stopwords('english'))
doctest = tm_map(doctest, removePunctuation)
doctest = tm_map(doctest, stripWhitespace) # 훈련 데이터로 학습을 했으니 테스트 데이터로 확인함

dtmtest = DocumentTermMatrix(doctest, control = list(dictionary = dtms$dimnames$Terms))         
dim(dtmtest)
str(dtmtest)
inspect(dtmtest)

x1 = as.matrix(dtmtest)
datatest = as.data.frame(cbind(mtest$sentiment, x1))
datatest$V1 = as.factor(datatest$V1)
colnames(datatest)[1] = 'y'

pr = predict(r, newdata = datatest, type = 'class') # 의사결정트리로 학습한 결과
table(pr, datatest$y)

pf = predict(f, newdata = datatest) # 랜덤포레스트로 학습한 결과
table(pf, datatest$y)

# 결과적으로, 정확도는 랜덤포레스트로 돌린 것이 더 좋다.