/*
Посчитать, сколько раз была заказана каждая книга, для книги вывести ее автора (нужно посчитать, в каком количестве заказов фигурирует каждая книга).  
Вывести фамилию и инициалы автора, название книги, последний столбец назвать Количество. Результат отсортировать сначала  по фамилиям авторов, а потом по названиям книг.
*/

SELECT name_author,title ,COUNT(buy_book.amount) Количество FROM buy_book
RIGHT JOIN book USING(book_id)
INNER JOIN author USING(author_id)
GROUP BY book_id
ORDER BY name_author, title
