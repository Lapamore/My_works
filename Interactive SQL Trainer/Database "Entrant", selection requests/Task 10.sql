/*
Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали документы на эту образовательную программу, но не могут быть зачислены на нее. 
Эти абитуриенты имеют результат по одному или нескольким предметам ЕГЭ, необходимым для поступления на эту образовательную программу, меньше минимального балла.
Информацию вывести в отсортированном сначала по программам, а потом по фамилиям абитуриентов виде.
Например, Баранов Павел по «Физике» набрал 41 балл, а  для образовательной программы «Прикладная механика» минимальный балл по этому предмету определен в 45 баллов. 
Следовательно, абитуриент на данную программу не может поступить.
*/

SELECT name_program,name_enrollee FROM enrollee
INNER JOIN program_enrollee 
    ON program_enrollee.enrollee_id = enrollee.enrollee_id
INNER JOIN program 
    ON program.program_id = program_enrollee.program_id
INNER JOIN program_subject 
    ON program_subject.program_id = program.program_id 
INNER JOIN enrollee_subject 
    ON program_subject.subject_id = enrollee_subject.subject_id AND enrollee_subject.enrollee_id = enrollee.enrollee_id
WHERE result < min_result 
ORDER BY 1,2
