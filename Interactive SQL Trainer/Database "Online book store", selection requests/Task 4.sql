/*
Вывести номера всех оплаченных заказов и даты, когда они были оплачены.
*/

SELECT buy_id,date_step_end FROM buy_step
WHERE step_id = 1 AND date_step_end IS NOT NULL
