/*
Вывести все заказы Баранова Павла (id заказа, какие книги, по какой цене и в каком количестве он заказал) в отсортированном по номеру заказа и названиям книг виде.
*/

SELECT buy.buy_id, title, price, buy_book.amount FROM book
INNER JOIN buy_book ON buy_book.book_id = book.book_id
INNER JOIN buy ON buy_book.buy_id = buy.buy_id
INNER JOIN client ON buy.client_id = client.client_id
WHERE name_client = "Баранов Павел"
ORDER BY buy.buy_id, title;
