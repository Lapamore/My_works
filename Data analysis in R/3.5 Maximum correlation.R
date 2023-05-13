#Напишите функцию high.corr, которая принимает на вход датасет с произвольным числом количественных переменных и возвращает вектор с именами двух переменных с максимальным абсолютным значением коэффициента корреляции.

high.corr <- function(x){
  correl <- cor(x)
  diag(correl) <- 0
  k <- arrayInd(which.max(abs(correl)), dim(correl))
  return(c(colnames(correl)[k[,2]],rownames(correl)[k[,1]]))  
}
