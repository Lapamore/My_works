#Напишите функцию outliers.rm, которая находит и удаляет выбросы. Для обнаружения выбросов воспользуемся самым простым способом, с которым вы не раз встречались, используя график Box plot. 
#Выбросами будем считать те наблюдения, которые отклоняются от 1 или 3 квартиля больше чем на 1,5 *  IQR, где  IQR  - межквартильный размах.

outliers.rm <- function(x){
  result <- c()
  
  interquartile_range <- IQR(x) * 1.5
  quantile_1_3 <- quantile(x, probs = c(0.25, 0.75)) 
  
  minimal <- quantile_1_3[1]-interquartile_range
  maximum <- quantile_1_3[2]+interquartile_range
  
  for (i in x){
    if (i > minimal && i < maximum){
      result <- append(result,i)
    }
  }
  return(result)
}
