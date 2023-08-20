/*
Случайным образом выбрать три вопроса (запрос) по дисциплине, тестирование по которой собирается проходить студент, 
занесенный в таблицу attempt последним, и добавить их в таблицу testing.id последней попытки получить как максимальное значение id из таблицы attempt.
*/

INSERT INTO testing (attempt_id, question_id)
    SELECT  attempt_id, question_id  FROM question
    INNER JOIN attempt USING(subject_id)
    WHERE  
       attempt_id = (SELECT MAX(attempt_id) FROM attempt)
    ORDER BY RAND()
    LIMIT 3
