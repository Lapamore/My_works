/*
Выбрать всех клиентов, которые заказывали книги Достоевского, информацию вывести в отсортированном по алфавиту виде. В решении используйте фамилию автора, а не его id.
*/

SELECT DISTINCT name_client FROM client
    INNER JOIN buy USING (client_id)
    INNER JOIN buy_book USING (buy_id)
    INNER JOIN book USING (book_id)
    INNER JOIN author USING (author_id)
WHERE author.name_author = "Достоевский Ф.М."
ORDER BY name_client;
