/*
Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, цену и количество экземпляров книг),
написанных в самых популярных жанрах, в отсортированном в алфавитном порядке по названию книг виде. 
Самым популярным считать жанр, общее количество экземпляров книг которого на складе максимально.
*/

SELECT title,name_author,name_genre,price,amount FROM genre
JOIN book
  ON book.genre_id = genre.genre_id
JOIN author
  ON book.author_id = author.author_id
WHERE genre.genre_id IN
    (
        SELECT DISTINCT query_1.genre_id
         FROM
        (SELECT genre_id , SUM(amount) as sum_amount FROM book GROUP BY genre_id ORDER BY sum_amount DESC LIMIT 2)            query_1
    )
ORDER BY title;
