#Постройте столбчатую диаграмму распределения цвета глаз по цвету волос только у женщин из таблицы HairEyeColor.
#По оси X должен идти цвет волос, цвет столбиков должен отражать цвет глаз.
#По оси Y - количество наблюдений.

library("ggplot2")
mydata <- as.data.frame(HairEyeColor)
obj <- ggplot(data = subset(mydata,Sex == "Female"), aes(x = Hair , y = Freq)) +
              geom_bar(stat="identity", position = position_dodge(),aes(fill = Eye)) + 
              scale_fill_manual(values=c("Brown", "Blue", "Darkgrey", "Darkgreen"))
