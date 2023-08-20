/*
Вывести все заказы Баранова Павла (id заказа, какие книги, по какой цене и в каком количестве он заказал) в отсортированном по номеру заказа и названиям книг виде.
*/

SELECT name_genre, SUM(buy_book.amount) AS Количество FROM genre
JOIN book USING(genre_id)
JOIN buy_book USING(book_id)
GROUP BY name_genre
HAVING Количество IN 
        (SELECT Количество FROM (SELECT name_genre, SUm(buy_book.amount) AS Количество FROM genre
         JOIN book USING(genre_id)
         JOIN buy_book USING(book_id)
         GROUP BY name_genre
         LIMIT 1) q)
