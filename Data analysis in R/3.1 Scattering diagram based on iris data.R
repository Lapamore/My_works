#Постройте scatterplot по данным iris, сохранив его в переменную my_plot : 
#Ось X - переменная Sepal.Width
#Ось Y -  переменная Petal.Width
#Цвет точек - переменная Species
#Также добавьте линейное сглаживание для каждой группы наблюдений по переменной Species.

library(ggplot2)
my_plot <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, col = factor(Species)))+
  geom_point(size = 5)+
  geom_smooth(method = "lm")

