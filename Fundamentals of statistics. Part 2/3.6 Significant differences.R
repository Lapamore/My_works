#Функция должна вернуть названия переменных, по которым были обнаружен значимые различия между выделенными кластерами 
#(p < 0.05). Иными словами, после того, как мы выделили заданное число кластеров, мы добавляем в исходные данные
#новую группирующую переменную — номер кластера, и сравниваем получившиеся группы между собой по 
#количественным переменным при помощи дисперсионного анализа.

get_difference<-  function(test_data, n_cluster){
    dist_matrix <- dist(test_data)
    fit <- hclust(dist_matrix)
    test_data$cluster <- cutree(fit, n_cluster)
    result <- sapply(test_data, function(x) summary(aov(x~factor(cluster), data = test_data))[[1]][["Pr(>F)"]])
    result <- result[1,1:ncol(result)-1]
    return(names(result[result<0.05]))
}
