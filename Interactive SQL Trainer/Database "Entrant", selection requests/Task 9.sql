/*
Посчитать количество баллов каждого абитуриента на каждую образовательную программу, на которую он подал заявление, 
по результатам ЕГЭ. В результат включить название образовательной программы, фамилию и имя абитуриента,
а также столбец с суммой баллов, который назвать itog. Информацию вывести в отсортированном сначала по образовательной программе, а потом по убыванию суммы баллов виде.
*/

SELECT name_program, name_enrollee, SUM(result) AS itog FROM enrollee
INNER JOIN program_enrollee 
    ON program_enrollee.enrollee_id = enrollee.enrollee_id
INNER JOIN program 
    ON program.program_id = program_enrollee.program_id
INNER JOIN program_subject 
    ON program_subject.program_id = program.program_id
INNER JOIN subject 
    ON subject.subject_id = program_subject.subject_id
INNER JOIN enrollee_subject 
    ON subject.subject_id = enrollee_subject.subject_id AND enrollee_subject.enrollee_id = enrollee.enrollee_id
GROUP BY 1,2
ORDER BY 1, itog DESC
