#Напишите функцию normality.test, которая получает на вход dataframe с количественными переменными, проверяет распределения каждой переменной на нормальность с помощью функции shapiro.test.
#Функция должна возвращать вектор с значениями p - value, полученного в результате проверки на нормальность каждой переменной. Названия элементов вектора должны совпадать с названиями переменных. 

normality.test  <- function(x){
  fan <- apply(x,2,shapiro.test)
  result <- c()
  for (i in fan){
    result <- c(result,i$p.value)
  }
  names(result) <- colnames(x)
  return(result)
}
