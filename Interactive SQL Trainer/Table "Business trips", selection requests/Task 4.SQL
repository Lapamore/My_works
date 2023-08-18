/*
Вывести два города, в которых чаще всего были в командировках сотрудники. Вычисляемый столбец назвать Количество.
*/

SELECT city, (COUNT(city)) as Количество FROM trip
GROUP BY city
ORDER BY (COUNT(city)) DESC
LIMIT 2;
