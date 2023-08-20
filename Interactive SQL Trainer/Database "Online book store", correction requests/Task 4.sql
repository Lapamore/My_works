/*
Уменьшить количество тех книг на складе, которые были включены в заказ с номером 5.
*/

UPDATE book JOIN buy_book USING(book_id)
SET
    book.amount = book.amount - buy_book.amount
    WHERE buy_book.buy_id = 5
