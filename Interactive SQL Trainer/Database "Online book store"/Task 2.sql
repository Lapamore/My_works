/*
Удалить из таблиц book и supplyкниги, цены которых заканчиваются на 99 копеек. Например, книга с ценой 670.99 должна быть удалена.
*/

DELETE FROM book
WHERE price LIKE "%.99";
DELETE FROM supply
WHERE price LIKE "%.99";
