require('ggplot2')
require('dplyr')

x %>% group_by(Category, Genres) %>% summarize(n = n()) %>% arrange(Category) %>% ggplot(aes(Category, Genres, size = n)) + geom_point() + theme(axis.text.y = element_text(size = 5), axis.text.x = element_text(size = 7, angle = -45, hjust = 0, vjust = 0))
