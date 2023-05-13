#Напишите функцию resid.norm, которая тестирует распределение остатков от модели на нормальность при помощи функции shapiro.test и создает гистограмму при помощи функции ggplot() с красной заливкой "red", 
#если распределение остатков значимо отличается от нормального (p < 0.05), и с зелёной заливкой "green" - если распределение остатков значимо не отличается от нормального.

resid.norm  <- function(fit_new){
  shapiro <- shapiro.test(fit_new$resid)
  df <- as.data.frame(fit_new$resid)
  if (shapiro$p.value < 0.05){
    ggplot(df, aes(x = fit_new$resid))+
      geom_histogram(fill = "red")
  }else{
    ggplot(df, aes(x = fit_new$resid))+
      geom_histogram(fill = "green")
  }
}
