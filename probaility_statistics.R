#install.packages('arules')
#install.packages('arulesViz')

require('arules')
require('arulesViz')
# 데이터셋을 불러옴
library(datasets)
data(Groceries)
Groceries
# 데이터들 중에서 데이터량이 많은 상위 20개를 추출
itemFrequencyPlot(Groceries, topN = 20, type = "absolute")
# 연관규칙분석을 위해 apriori 함수를 사용
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
summary(rules)
# 연관규칙분석을 적용한 후 데이터들
inspect(rules[1:5])
# 그 데이터들을 confidence를 기준으로 오름차순정렬을 함
rules <- sort(rules, by = 'confidence', decreasing = FALSE)
inspect(rules[1:5])
help(apriori)

head(rules)
