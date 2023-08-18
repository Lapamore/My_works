/*
Если в таблицах supply  и book есть одинаковые книги, которые имеют равную цену,  вывести их название и автора,
а также посчитать общее количество экземпляров книг в таблицах supply и book,  столбцы назвать Название, Автор  и Количество.
*/

SELECT title as Название,name_author as Автор,book.amount + supply.amount as Количество from book 
JOIN supply
    USING(title)
JOIN author
    USING(author_id)
WHERE book.price = supply.price
