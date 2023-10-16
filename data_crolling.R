install.packages('quantmod')

library(quantmod)

#quandi의 데이터를 크롤링함
url.aapl = "https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.csv?api_key=xw3NU3xLUZ7vZgrz5QnG"
data.aapl = read.csv(url.aapl)


getSymbols("AAPL", env=NULL)[2324:2328,]

ticker = c('FB', 'NVDA') 
getSymbols(ticker)
