#Визуализируйте взаимодействие переменных wt и am, дополнив код, приведённый в задании: Ось x - переменная wt, Ось y - переменная mpg. Цвет регрессионных прямых - переменная am

library(ggplot2)
mtcars$am <- factor(mtcars$am, labels = c(0,1))
my_plot <- ggplot(mtcars, aes(x = wt, y = mpg, color = am))+
  geom_smooth(method  = "lm")
