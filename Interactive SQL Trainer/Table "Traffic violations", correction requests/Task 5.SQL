/*
В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей. 
*/

UPDATE 
    fine, 
    (SELECT name,number_plate,violation FROM fine GROUP BY name, number_plate,violation HAVING COUNT(violation)>=2)     as new
SET 
    sum_fine = IF(date_payment IS NULL,sum_fine*2,sum_fine)
WHERE fine.name = new.name;
SELECT * FROM fine;
