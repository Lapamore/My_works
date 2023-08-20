/*
Повысить итоговые баллы абитуриентов в таблице applicant на значения дополнительных баллов (использовать запрос из предыдущего урока).
*/

UPDATE applicant JOIN (SELECT enrollee_id, SUM(bonus) as Бонус FROM achievement
INNER JOIN enrollee_achievement USING (achievement_id) GROUP BY 1) AS q 
SET
    itog = itog + Бонус
WHERE applicant.enrollee_id = q.enrollee_id;
SELECT * FROM applicant;
