/*
Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», а для книги «Остров сокровищ» Стивенсона - «Приключения». (Использовать два запроса).
*/

UPDATE book 
SET genre_id = (SELECT genre_id FROM genre WHERE name_genre = "Поэзия")
WHERE title = "Стихотворения и поэмы" and book.author_id = 
    (
       SELECT author_id FROM author
       WHERE name_author = "Лермонтов М.Ю." 
    );
UPDATE book 
SET genre_id = (SELECT genre_id FROM genre WHERE name_genre = "Приключения")
WHERE title = "Остров сокровищ" and book.author_id = 
    (
       SELECT author_id FROM author
       WHERE name_author = "Стивенсон Р.Л." 
    );
SELECT * FROM book
