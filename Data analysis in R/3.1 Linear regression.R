#Только для бриллиантов класса Ideal (переменная cut) c числом карат равным 0.46 (переменная carat) постройте линейную регрессию,
#где в качестве зависимой переменной выступает price, в качестве предиктора - переменная  depth. 
#Cохраните коэффициенты регрессии в переменную fit_coef.

df <- (subset(diamonds, diamonds$cut == "Ideal" & diamonds$carat == "0.46"))
fit <- lm(price~depth,df)
fit_coef <- fit$coefficients
