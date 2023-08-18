/*
Вывести все жанры, которые не представлены в книгах на складе.
*/

SELECT name_genre FROM genre 
WHERE name_genre NOT IN (SELECT name_genre FROM book LEFT JOIN genre ON genre.genre_id = book.genre_id); 
