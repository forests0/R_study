install.packages('ROCR')
require('ROCR')

labelss = c(0,0,1,0,1,1,0,0,0,1)
predictionss = c(0.26,0.81,0.73,0.11,0.20,0.48,0.23,0.11,0.61,0.99)

p = prediction(predictionss, labelss)
roc = performance(p, measure = 'tpr', x.measure = 'fpr')
plot(roc)
abline(a = 0, b = 1)

auc = performance(p, measure = 'auc')
auc@y.values
