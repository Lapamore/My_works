/*
Вывести всю информацию из таблицы book, упорядоченную по возрастанию длины названия книги.
*/

SELECT * FROM book
ORDER BY LENGTH(title)
