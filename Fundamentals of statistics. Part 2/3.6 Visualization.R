#В данных swiss, используя все переменные, выделите два кластера при помощи иерархической кластеризации и 
#cохраните значение кластеров как фактор в переменную cluster. Должно получиться:

# сначала создайте переменную cluster в данных swiss
dist_matrix <- dist(swiss)
hc1 <- hclust(dist_matrix)
swiss$cluster <- factor(cutree(hc1, k = 2))
# дополните код, чтобы получить график
library(ggplot2)
my_plot <- ggplot(swiss, aes(x = Education, y = Catholic, col = cluster))+
  geom_point()+
  geom_smooth(method='lm')
