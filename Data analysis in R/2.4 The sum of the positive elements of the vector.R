#Напишите функцию filtered.sum, которая на вход получает вектор с пропущенными, положительными и отрицательными значениями и возвращает сумму положительных элементов вектора.

filtered.sum <- function(x){
  result <- 0
  for (i in x){
    if (i > 0 && !is.na(i)){
      result <- result + i
    }
  }
  return(result)
}
