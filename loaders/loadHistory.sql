.mode csv
.import csv/history-p7.csv course_history_temp

INSERT INTO course_history (student_id, year, title, course_id, grade, mark)
SELECT
    s.id,
    c.year,
    c.title,
    c.course,
    c.grade,
    c.mark
FROM course_history_temp c
INNER JOIN students s ON s.name = c.student;

DROP TABLE course_history_temp;

.import csv/history-p6.csv course_history_temp

INSERT INTO course_history (student_id, year, title, course_id, grade, mark)
SELECT
    s.id,
    c.year,
    c.title,
    c.course,
    c.grade,
    c.mark
FROM course_history_temp c
INNER JOIN students s ON s.name = c.student;

DROP TABLE course_history_temp;
