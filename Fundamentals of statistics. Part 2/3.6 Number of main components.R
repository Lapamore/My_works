#Напишите функцию get_pca2, которая принимает на вход dataframe с произвольным числом количественных 
#переменных. Функция должна рассчитать, какое минимальное число главных компонент объясняет
#больше 90% изменчивости в исходных данных и
#добавлять значения этих компонент в исходный dataframe в виде новых переменных.

get_pca2 <- function(df){
  results <- summary(prcomp(df))
  PC <- results$importance[3,]
  vec <-c(names(PC[PC <= PC[PC>0.9][1]]))
  selected_columns <- results$x[, vec]
  return(cbind(df,results$x[, vec]))
}
