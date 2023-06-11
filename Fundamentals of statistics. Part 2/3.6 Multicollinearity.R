#Напишите функцию is_multicol, которая получает на вход dataframe произвольного размера
#с количественными переменными. Функция должна проверять существование строгой мультиколлинеарности,
#а именно наличие линейной комбинации между предикторами.

is_multicol <- function(test_data) {
  corr <- cor(test_data)
  diag(corr) <- 0
  out <- row.names(which(abs(corr) > 0.99, arr.ind=TRUE))
  if (length(out) == 0) {
    print("There is no collinearity in the data")
  } else {
  print(out)
  }
}
