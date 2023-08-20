/*
Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров и их стоимости за 2020 и 2019 год .
Вычисляемые столбцы назвать Количество и Сумма. Информацию отсортировать по убыванию стоимости.
*/

SELECT title, SUM(Количество) AS Количество, SUM(Сумма) AS Сумма FROM
    (SELECT title, SUM(buy_book.amount) as Количество, SUM(buy_book.amount * price) as Сумма FROM book
    INNER JOIN buy_book USING(book_id)
    INNER JOIN buy USING(buy_id)
    INNER JOIN buy_step USING(buy_id)
    WHERE step_id = 1 AND date_step_end IS NOT NULL
    GROUP BY 1
    UNION ALL 
    SELECT title, SUM(buy_archive.amount) as Количество, SUM(buy_archive.amount * buy_archive.price) as Сумма FROM book
    INNER JOIN buy_archive USING(book_id)
    GROUP BY 1) q
GROUP BY 1
ORDER BY 3 DESC
