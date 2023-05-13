#Используя библиотеку ggplot2 и встроенные данные diamonds, постройте график распределения частот переменной color, на котором за цвет заполнения столбиков отвечает переменная cut. 
#Сохраните код графика в переменную obj. В итоге должен получиться вот такой график.

library(ggplot2)
ggplot(data = diamonds, aes(x = color,fill = cut, position = "dodge"))+
  geom_histogram(stat = "count", position = position_dodge())

