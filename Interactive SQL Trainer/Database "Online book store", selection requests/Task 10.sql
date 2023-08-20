/*
Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы.
Для этого вывести год, месяц, сумму выручки в отсортированном сначала по возрастанию месяцев, затем по возрастанию лет виде. Название столбцов: Год, Месяц, Сумма.
*/

SELECT YEAR(date_payment) AS Год, MONTHNAME(date_payment) AS Месяц,SUM(price*amount) AS Сумма
FROM 
    buy_archive
GROUP BY 1,2
UNION

SELECT YEAR(date_step_end) AS Год, MONTHNAME(date_step_end) AS Месяц, SUM(price*buy_book.amount) AS Сумма
FROM 
    book 
    INNER JOIN buy_book USING(book_id)
    INNER JOIN buy USING(buy_id) 
    INNER JOIN buy_step USING(buy_id)
    INNER JOIN step USING(step_id)  
WHERE  date_step_end IS NOT Null and name_step = "Оплата"
GROUP BY 1,2
ORDER BY 2,1
