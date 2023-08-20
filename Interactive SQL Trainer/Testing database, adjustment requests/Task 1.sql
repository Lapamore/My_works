/*
В таблицу attempt включить новую попытку для студента Баранова Павла по дисциплине «Основы баз данных». Установить текущую дату в качестве даты выполнения попытки.
*/

INSERT INTO attempt(student_id,subject_id,date_attempt)
    SELECT student_id,subject_id, CURRENT_DATE() FROM student
    INNER JOIN attempt USING(student_id)
    INNER JOIN subject USING(subject_id)
    WHERE name_subject = "Основы баз данных" and name_student = "Баранов Павел"
