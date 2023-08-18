/*
Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве.
*/

SELECT DISTINCT name FROM trip
WHERE city = "Москва"
ORDER BY name;
