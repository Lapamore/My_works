/*
Вывести информацию о книгах(автор, название, цена), цена которых меньше самой большой из минимальных цен, вычисленных для каждого автора.
*/

SELECT author, title, price FROM book
WHERE price < ANY (SELECT MIN(price) FROM book GROUP by author);
