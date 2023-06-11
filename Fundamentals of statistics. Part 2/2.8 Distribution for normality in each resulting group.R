#Напишите функцию normality_by, которая принимает на вход dataframe c тремя переменными. 
#Первая переменная количественная, вторая и третья имеют две градации и разбивают наши наблюдения на группы. Функция должна проверять распределение на 
#нормальность в каждой получившейся группе и возвращать dataframe с результатами применения теста shapiro.test  (формат вывода смотри ниже).

normality_by <- function(test_data){
  names(test_data)[1] <- "x"
  test_shapiro <- aggregate(x~., test_data, function(x) shapiro.test(x)$p.value)
  names(test_shapiro)[3] <- "p_value"
  return(test_shapiro)
}
