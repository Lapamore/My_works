/*
В таблицу buy_book добавить заказ с номером 5. Этот заказ должен содержать книгу Пастернака «Лирика» в количестве двух экземпляров и книгу Булгакова «Белая гвардия» в одном экземпляре.
*/

INSERT INTO buy_book(buy_id,book_id,amount)
SELECT 5,book_id,IF(name_author = "Пастернак Б.Л.",2,1) FROM book
JOIN author USING(author_id)
WHERE name_author IN("Пастернак Б.Л.","Булгаков М.А.") and title IN ("Белая гвардия","Лирика")
ORDER BY book_id DESC ;
SELECT * FROM buy_book
