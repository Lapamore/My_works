/*
Посчитать результаты тестирования. Результат попытки вычислить как количество правильных ответов, деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. 
Результат округлить до двух знаков после запятой. Вывести фамилию студента, название предмета, дату и результат.
Последний столбец назвать Результат. Информацию отсортировать сначала по фамилии студента, потом по убыванию даты попытки.
*/

SELECT name_student, name_subject, date_attempt, ROUND((SUM(is_correct)/3*100),2) as Результат FROM student
INNER JOIN attempt USING (student_id)
INNER JOIN testing USING (attempt_id)
INNER JOIN subject USING (subject_id)
INNER JOIN answer ON answer.answer_id = testing.answer_id
GROUP BY 1,2,3
ORDER BY 1,3 DESC
