/*
Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, в соответствии с данными из таблицы traffic_violation. При этом суммы заносить только в пустые поля столбца  sum_fine.
Таблица traffic_violationсоздана и заполнена.
*/

UPDATE  fine f,traffic_violation tv
SET
    f.sum_fine = IF(f.sum_fine IS NULL,IF(f.violation = 'Превышение скорости(от 20 до 40)',500.00,1000.00),f.sum_fine)

WHERE f.violation = tv.violation;
