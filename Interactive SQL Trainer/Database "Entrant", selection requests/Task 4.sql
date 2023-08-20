/*
Вывести образовательные программы, для которых минимальный балл ЕГЭ по каждому предмету больше или равен 40 баллам. Программы вывести в отсортированном по алфавиту виде
*/

SELECT name_program FROM (SELECT name_program, MIN(min_result) as result  FROM program
INNER JOIN program_subject USING (program_id)
GROUP BY 1
HAVING result >= 40 ORDER BY 1) q
