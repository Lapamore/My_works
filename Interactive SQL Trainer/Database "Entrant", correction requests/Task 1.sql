/*
Создать вспомогательную таблицу applicant,  куда включить id образовательной программы,  id абитуриента, сумму баллов абитуриентов (столбец itog) 
в отсортированном сначала по id образовательной программы, а потом по убыванию суммы баллов виде (использовать запрос из предыдущего урока).
*/

CREATE TABLE applicant AS 
    SELECT program_subject.program_id, enrollee_subject.enrollee_id, SUM(result) AS itog FROM enrollee
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
