stat_mode <- function(x){
  table_new <- table(x)
  return(c(as.numeric((names(which(max(table_new) == table_new))))))
}
