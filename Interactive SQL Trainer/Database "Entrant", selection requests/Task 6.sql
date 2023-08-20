/*
Посчитать, сколько дополнительных баллов получит каждый абитуриент. Столбец с дополнительными баллами назвать Бонус. Информацию вывести в отсортированном по фамилиям виде.
*/

SELECT name_enrollee, IF(SUM(bonus) IS NOT NULL,SUM(bonus),0) as Бонус FROM achievement
INNER JOIN enrollee_achievement USING (achievement_id)
RIGHT JOIN enrollee USING (enrollee_id)
GROUP BY 1
ORDER BY 1
