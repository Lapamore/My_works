#HairEyeColor - таблица с данными, встроенными в R. Посмотрите на неё в R. Ваша задача в переменную red_men сохранить долю рыжеволосых (Red) от общего числа голубоглазых мужчин.

red <- prop.table(HairEyeColor[, , 'Male'],2)
red_men <- red['Red','Blue']
