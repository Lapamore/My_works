#В этом задании вашей задачей будет  написать функцию centered, которая получает на вход датафрейм и имена переменных, которые необходимо центрировать так, как это описано выше.
#Функция должна возвращать этот же датафрейм, только с центрированными указанными переменными.

centered <- function(test_data, var_names){
  for (name in var_names){
    mean_value <- mean(test_data[,name])
    test_data[name] <- test_data[name] - mean_value
  }
  return(test_data)
}
