#В уже существующей переменной my_vector сохранен вектор из 50 чисел. Решите задачу используя конструкцию:if () {} else {} 
#Если среднее значение вектора my_vector больше 20, в переменную result сохраните "My mean is great",  
#если среднее значение my_vector меньше или равно 20 то в переменную result сохраните  строку "My mean is not so great".

if (mean(my_vector) > 20) {
    result <- "My mean is great"
} else { result <- "My mean is not so great"
} 
