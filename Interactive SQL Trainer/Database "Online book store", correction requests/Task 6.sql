/*
Создать общий счет (таблицу buy_pay) на оплату заказа с номером 5. 
Куда включить номер заказа, количество книг в заказе (название столбца Количество) и его общую стоимость (название столбца Итого).  Для решения используйте ОДИН запрос.
*/

CREATE TABLE buy_pay(
    SELECT buy_id,
        SUM(buy_book.amount) as Количество,
        SUM(buy_book.amount*book.price) as Итого
    FROM buy_book
    INNER JOIN book USING(book_id)
    WHERE buy_id = 5
    GROUP BY 1)
