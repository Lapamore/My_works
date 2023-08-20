/*
В таблицу buy_step для заказа с номером 5 включить все этапы из таблицы step, которые должен пройти этот заказ. В столбцы date_step_beg и date_step_end всех записей занести Null.
*/

INSERT INTO buy_step(buy_id,step_id)
    SELECT 5, step_id FROM buy_step
    CROSS JOIN step USING(step_id)
    GROUP BY step_id;

SELECT * FROM buy_step
