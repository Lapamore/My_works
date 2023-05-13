#Доктор Пилюлькин решил вооружиться статистикой, чтобы сравнить эффективность трех лекарств! Давайте поможем ему и напишем функцию max_resid, 
#которая получает на вход dataframe с двумя переменными: типом лекарства и результатом его применения. 
#Функция должна находить ячейку таблицы сопряженности с максимальным  значением стандартизированного остатка и возвращать вектор из двух элементов: название строчки и столбца этой ячейки.

test_data <- read.csv("https://stepic.org/media/attachments/course/524/test_drugs.csv",stringsAsFactors = TRUE)

max_resid <- function(x){
  table_test_data <- table(x)
  standardized_balances <- chisq.test(table_test_data)$stdres
  index <- which(max(standardized_balances) == standardized_balances, arr.ind = T)
  return(c(row.names(table_test_data)[index[1]],colnames(table_test_data)[index[2]]))
}

max_resid(test_data)
