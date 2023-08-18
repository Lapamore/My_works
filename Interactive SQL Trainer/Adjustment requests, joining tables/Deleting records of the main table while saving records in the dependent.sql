/*
Удалить все жанры, к которым относится меньше 4-х наименований книг. В таблице book для этих жанров установить значение Null.
*/

DELETE FROM genre
WHERE genre_id IN
(SELECT genre_id FROM book
GROUP BY genre_id
HAVING COUNT(genre_id) < 4);
SELECT * FROM book;
