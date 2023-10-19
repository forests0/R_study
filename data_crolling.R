install.packages('quantmod')

library(quantmod)

#quandi의 데이터를 크롤링함
url.aapl = "https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.csv?api_key=xw3NU3xLUZ7vZgrz5QnG"
data.aapl = read.csv(url.aapl)

# 애플 주식 가져오기
getSymbols("AAPL", env=NULL)[2324:2328,]

ticker = c('FB', 'NVDA') 
getSymbols(ticker)

data = getSymbols('AAPL',
                  from = '2000-01-01', to = '2018-12-31',
                  auto.assign = FALSE)
head(data)

# 한국 주식 가져오기.
getSymbols('005930.KS',
           from = '2000-01-01', to = '2018-12-31')
