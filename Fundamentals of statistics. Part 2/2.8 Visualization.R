#При помощи библиотеки ggplot2 визуализируйте распределение переменной Sepal.Length в трех группах в данных Iris.
#Сохраните график в переменную obj, но не выводите график на печать.

obj <- ggplot(data = iris, aes(x = Sepal.Length,fill = Species))+
  geom_density(alpha = 0.2)
