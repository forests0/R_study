#텍스트 마이닝
install.packages('RCurl')
install.packages('XML')
install.packages('tm')
install.packages('SnowballC')
install.packages('wordcloud')
install.packages('wordcloud2')

require('RCurl')
require('XML')
require('tm')
require('SnowballC')
require('wordcloud')
require('wordcloud2')

t = readLines('https://en.wikipedia.org/wiki/Data_science') # 위키피디아에서 가져옴
d = htmlParse(t, asText = TRUE) # html로 가져오고
cdoc = xpathSApply(d, '//p', xmlValue) #xml 값으로 전환
doc = Corpus(VectorSource(cdoc))
inspect(doc)

doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removeWords, stopwords('english'))
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace) # 데이터 전처리과정들. 숫자, 특정 단어들을 제거하는 과정

dtm = DocumentTermMatrix(doc)
dim(dtm)
inspect(dtm) # 전처리를 모두 끝낸 후 결과

# 단어 구름 만들기(시각화)
m = as.matrix(dtm)
v = sort(colSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 100, random.order = FALSE, rot.per = 0.35)
pal = brewer.pal(11, 'Spectral')
# 색상 추가, 폰트 설정 등을 할 수 있음. 
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.50, colors = pal)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.50, colors = pal, family = 'mono', font = 2)

# 단어들의 font 설정이나 크기 등을 wordcloud2를 써서 생략할 수 있음.
# 전처리는 해야됨.
wordcloud2(d)

d1 = d[1:200, ] # 단어를 200개만 표기
wordcloud2(d1, shape='star') # 모양 등을 설정해줄 수 있음
wordcloud2(d1, minRotation = pi / 4, maxRotation = pi / 4, rotateRatio = 1.0)

findFreqTerms(dtm, lowfreq = 12)
findAssocs(dtm, terms = 'harvard', corlimit = 0.7)
barplot(d[1:10, ]$freq, las = 2, names.arg = d[1:10, ]$word, col = 'lightblue', main = '발생 빈도 상위 단어', ylab = '단어 빈도')

#한글로 텍스트 구름 제작
kt = readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
kd = htmlParse(kt, asText = TRUE)
kcdoc = xpathSApply(kd, '//p', xmlValue)

kdoc = Corpus(VectorSource(kcdoc))
inspect(kdoc)

kdoc = tm_map(kdoc, content_transformer(tolower))
kdoc = tm_map(kdoc, removeNumbers)
kdoc = tm_map(kdoc, removePunctuation)
kdoc = tm_map(kdoc, stripWhitespace) # 데이터 전처리과정들. 숫자, 특정 단어들을 제거하는 과정

kdtm = DocumentTermMatrix(kdoc)
dim(kdtm)
inspect(kdtm)

km = as.matrix(kdtm)
kv = sort(colSums(km), decreasing = TRUE)
kd = data.frame(word = names(kv), freq = kv)
kd1 = kd[1:200, ]
wordcloud2(kd1)
