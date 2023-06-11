#Начнем с простого и вспомним, как применять логистическую регрессию в R. Напишите функцию get_coefficients, которая получает на вход dataframe с двумя переменными x
#(фактор с произвольным числом градаций) и y ( фактор с двумя градациями). 
#Функция строит логистическую модель, где y — зависимая переменная, а x — независимая, и возвращает вектор со значением экспоненты коэффициентов модели. 

get_coefficients <- function(dataset){
  dataset <- transform(dataset, x = factor(x), y = factor(y))
  fit <- glm(y~x, dataset, family = "binomial")
  return (exp(fit$coefficients))
}
