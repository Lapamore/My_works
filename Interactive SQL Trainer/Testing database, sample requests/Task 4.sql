/*
Если студент совершал несколько попыток по одной и той же дисциплине, то вывести разницу в днях между первой и последней попыткой.
В результат включить фамилию и имя студента, название дисциплины и вычисляемый столбец Интервал. 
Информацию вывести по возрастанию разницы. Студентов, сделавших одну попытку по дисциплине, не учитывать. 
*/

SELECT name_student, name_subject, DATEDIFF(MAX(date_attempt),MIN(date_attempt)) as Интервал 
FROM subject
INNER JOIN attempt USING (subject_id)
INNER JOIN student USING (student_id)
GROUP BY 1,2
HAVING Интервал <> 0
ORDER BY Интервал;
