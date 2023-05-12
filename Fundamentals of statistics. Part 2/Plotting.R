library(ggplot2)
ggplot(data = diamonds, aes(x = color,fill = cut, position = "dodge"))+
  geom_histogram(stat = "count", position = position_dodge())

