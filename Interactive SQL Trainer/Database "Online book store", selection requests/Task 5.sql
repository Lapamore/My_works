/*
Вывести информацию о каждом заказе: его номер, кто его сформировал (фамилия пользователя) и его стоимость 
(сумма произведений количества заказанных книг и их цены), в отсортированном по номеру заказа виде. Последний столбец назвать Стоимость.
*/

SELECT buy_book.buy_id, name_client, SUM(buy_book.amount * book.price) as Стоимость FROM book
INNER JOIN buy_book USING(book_id)
INNER JOIN buy USING(buy_id)
INNER JOIN client USING(client_id)
GROUP BY buy_book.buy_id
ORDER BY buy_book.buy_id;
