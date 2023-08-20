/*
Вывести образовательные программы, на которые для поступления необходим предмет «Информатика». Программы отсортировать в обратном алфавитном порядке.
*/

SELECT name_program FROM program
INNER JOIN program_subject USING (program_id)
INNER JOIN subject USING (subject_id)
WHERE name_subject = "Информатика"
ORDER BY 1 DESC
