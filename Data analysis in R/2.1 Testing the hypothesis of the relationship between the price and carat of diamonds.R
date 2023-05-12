#При помощи критерия Хи - квадрат проверьте гипотезу о взаимосвязи цены (price) и каратов (carat) бриллиантов.
#Для этого сначала нужно перевести эти количественные переменные в формат пригодный для Хи - квадрат. Создайте две новые переменные в данных diamonds:

diamonds$factor_price <- factor(ifelse(diamonds$price >= mean(diamonds$price), 1, 0))
diamonds$factor_carat <- factor(ifelse(diamonds$carat >= mean(diamonds$carat), 1, 0))    
main_stat <- chisq.test(diamonds$factor_price, diamonds$factor_carat)$statistic
