#Используем знакомые нам данные mtcars. 
#Нужно построить scatterplot с помощью ggplot из ggplot2, по оси x которого будет mpg, по оси y - disp, а цветом отобразить переменную (hp).
#Полученный график нужно сохранить в переменную plot1

plot1 <- ggplot(mtcars, aes(x = mpg, y = disp, col = hp))+
  geom_point()
