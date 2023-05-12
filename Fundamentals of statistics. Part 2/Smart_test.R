smart_test <- function(df){
  df <- table(df)
  if (min(df) > 5){
    test <- chisq.test(df)       
    return(c(test$statistic,test$parameter,test$p.value))
  }else{
    test <- fisher.test(df)
    return(test$p.value)
  }
}
