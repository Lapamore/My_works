/*
Завершить этап «Оплата» для заказа с номером 5, вставив в столбец date_step_end дату 13.04.2020, и начать следующий этап («Упаковка»), задав в столбце date_step_beg для этого этапа ту же дату.
Реализовать два запроса для завершения этапа и начале следующего. Они должны быть записаны в общем виде, чтобы его можно было применять для любых этапов, изменив только текущий этап. Для примера пусть это будет этап «Оплата».
*/

UPDATE 
    buy_step
SET 
    buy_step.date_step_end = "2020-04-13"
    WHERE buy_step.step_id = 1 AND buy_step.buy_id = 5;
UPDATE 
    buy_step
SET 
    buy_step.date_step_beg = "2020-04-13"
    WHERE buy_step.step_id = 2 AND buy_step.buy_id = 5;
SELECT * FROM buy_step
