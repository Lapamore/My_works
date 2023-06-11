#Ваша функция принимает два набора данных и возвращает имя пассажира с наиболее подозрительным багажом. 
#Если несколько пассажиров получили максимальное значение вероятности, то верните вектор с несколькими именами. 
#В этой задаче для предсказания будем использовать все предикторы, даже если некоторые из них оказались незначимыми. Для предсказания стройте модель без взаимодействия предикторов.

most_suspicious <- function(test_data, data_for_predict){
  fit <- glm(as.factor(is_prohibited)~.,test_data, family = "binomial" )
  predict_values <- predict(fit,data_for_predict, type="response")
  index <- which(predict_values == max(predict_values))
  return(data_for_predict$passangers[index])
}
