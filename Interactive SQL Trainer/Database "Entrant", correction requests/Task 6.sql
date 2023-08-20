/*
Занести в столбец str_id таблицы applicant_order нумерацию абитуриентов, которая начинается с 1 для каждой образовательной программы.
*/

SET @row_num := 1;
SET @row_check := 0;
UPDATE applicant_order            
SET str_id = IF(program_id = @row_check, @row_num := @row_num + 1 ,@row_num := 1 AND @row_check := program_id);
SELECT * FROM applicant_order;
