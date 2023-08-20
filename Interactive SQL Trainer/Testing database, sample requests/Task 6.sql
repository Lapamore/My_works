/*
Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». В результат включите столбцы question_id и name_question.
*/

SELECT question_id, name_question FROM subject
INNER JOIN question USING(subject_id)
WHERE name_subject = "Основы баз данных"
ORDER BY RAND()
LIMIT 3
