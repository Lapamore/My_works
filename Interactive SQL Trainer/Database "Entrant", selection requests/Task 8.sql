/*
Вывести образовательные программы, на которые для поступления необходимы предмет «Информатика» и «Математика» в отсортированном по названию программ виде.
*/

SELECT name_program FROM program
INNER JOIN program_subject USING (program_id)
INNER JOIN subject USING (subject_id)
WHERE name_subject IN ('Информатика','Математика')
GROUP BY name_program
HAVING COUNT(subject_id) = 2
ORDER BY 1
