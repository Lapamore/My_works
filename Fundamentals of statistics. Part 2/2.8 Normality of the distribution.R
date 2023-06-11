#Напишите функцию normality_test, которая получает на вход dataframe с произвольным количеством переменных разных типов (количественные, строки, факторы) 
#и проверяет нормальность распределения количественных переменных. 
#Функция должна возвращать вектор значений p-уровней значимости теста shapiro.test для каждой количественной переменной.

normality_test <- function(dataset){
  dataset <- dataset[, sapply(dataset,is.numeric)]
  return(apply(dataset, 2, function(x) shapiro.test(x)$p.value))
}
