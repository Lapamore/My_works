#Напишите функцию smart_anova, которая получает на вход dataframe с двумя переменными x и y. Переменная x — это количественная переменная, переменная y - фактор, разбивает наблюдения на три группы.

smart_anova <- function(test_data){
  shapiro <- aggregate(x~y,test_data, shapiro.test)
  b_test <- bartlett.test(x~y,test_data)
  p_value_shapiro <- shapiro$x[,2]
  if ( (length(p_value_shapiro[p_value_shapiro<0.05]) == 0) && (b_test$p.value > 0.05)){
    fit <- aov(x~y,test_data)
    ANOVA <- summary(fit)[[1]]$'Pr(>F)'[1]
    names(ANOVA) <- "ANOVA"
    return(ANOVA)
  }else{
    KW <- kruskal.test (x ~ y, test_data)$p.value
    names(KW) <- "KW"
    return(KW)
  }
}
