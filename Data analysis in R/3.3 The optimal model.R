#C помощью функции step найдите оптимальную модель для предсказания rating в датасете attitude. Model_full и model_null уже созданы. Сохраните команду с функцией step в переменную ideal_model.

ideal_model <- step(model_full , direction = 'backward')
