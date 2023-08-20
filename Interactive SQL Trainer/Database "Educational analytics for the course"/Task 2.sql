/*
Заполнить таблицу step_keyword следующим образом: если ключевое слово есть в названии шага, то включить в step_keyword строку с id шага и id ключевого слова. 
*/

INSERT INTO step_keyword(step_id,keyword_id)
SELECT step_id, keyword_id FROM keyword
CROSS JOIN step
WHERE REGEXP_INSTR(step_name,CONCAT('\\b',keyword.keyword_name,'\\b')) 
