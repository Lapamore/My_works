/*
Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.
*/

SELECT title,name_genre,price 
FROM genre JOIN book ON 
book.genre_id = genre.genre_id
WHERE amount > 8
ORDER BY price DESC;
