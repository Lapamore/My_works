#Напишите функцию get_features , которая получает на вход набор данных о багаже. Строит логистическую регрессию, где зависимая переменная  - являлся ли багаж запрещенным, 
#а предикторы - остальные переменные, и возвращает вектор с названиями статистически значимых переменных (p < 0.05) (в модели без взаимодействия). 
#Если в данных нет значимых предикторов, функция возвращает строку с сообщением  "Prediction makes no sense".

get_features <- function(dataset){
  fit <- glm(is_prohibited~.,dataset, family = "binomial" )
  result <- anova(fit, test = "Chisq")
  p_value <- which(result$`Pr(>Chi)` < 0.05)
  if (length(p_value) == 0){
    return("Prediction makes no sense")
  }else{
    return(row.names(result)[p_value])
  }
}
