/*
Это многострочный комментарий.
Он может распространяться на несколько строк.
*/

SELECT name_genre,title,name_author FROM genre 
JOIN book ON  book.genre_id = genre.genre_id 
JOIN author ON book.author_id = author.author_id
WHERE name_genre = "Роман"
ORDER BY title;
