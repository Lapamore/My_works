#Напишите функцию smart_hclust, которая получает на вход dataframe  с произвольным числом количественных 
#переменных и число кластеров, 
#которое необходимо выделить при помощи иерархической кластеризации.
#Функция должна в исходный набор данных добавлять новую переменную фактор - cluster  -- 
#номер кластера, к которому отнесено каждое из наблюдений.

smart_hclust<-  function(test_data, cluster_number){
  dist_matrix <- dist(test_data)
  fit <- hclust(dist_matrix)
  test_data$cluster <- factor(cutree(fit, cluster_number))
  return(test_data)
}
