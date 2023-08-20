/*
Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить название книг, их автора, цену, количество заказанных книг и  стоимость.
Последний столбец назвать Стоимость. Информацию в таблицу занести в отсортированном по названиям книг виде.
*/

CREATE TABLE buy_pay(
    SELECT title, name_author,price,buy_book.amount, (book.price*buy_book.amount) as Стоимость FROM author
    INNER JOIN book USING(author_id)
    INNER JOIN buy_book USING(book_id)
    WHERE buy_book.buy_id = 5
    ORDER BY title
);
SELECT * FROM buy_pay;
