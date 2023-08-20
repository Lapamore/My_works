/*
Из таблицы applicant,  созданной на предыдущем шаге, удалить записи, если абитуриент на выбранную образовательную программу
не набрал минимального балла хотя бы по одному предмету (использовать запрос из предыдущего урока).
*/

DELETE FROM applicant
WHERE (program_id,enrollee_id) IN (
SELECT DISTINCT program_subject.program_id, enrollee_subject.enrollee_id FROM program_subject
INNER JOIN program_enrollee ON program_enrollee.program_id = program_subject.program_id
INNER JOIN enrollee_subject ON enrollee_subject.subject_id = program_subject.subject_id
WHERE result < min_result)
