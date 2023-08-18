/*
Посчитать количество экземпляров  книг каждого автора из таблицы author.  
Вывести тех авторов,  количество книг которых меньше 10, в отсортированном по возрастанию количества виде. Последний столбец назвать Количество.
*/

SELECT name_author, SUM(amount) as Количество FROM book RIGHT JOIN author ON author.author_id = book.author_id
GROUP BY name_author
HAVING Количество < 10 OR SUM(amount) IS NULL
ORDER BY Количество;

