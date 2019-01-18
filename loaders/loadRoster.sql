.mode csv
.import csv/s2/roster-p6.csv students_temp

INSERT INTO students (name, period, school_id, user_id, grade, gender, student_email, semester) 
SELECT 
    s.student,
    '6',
    s.student_id,
    s.user_id,
    s.grade,
    s.gender,
    s.student_email,
    2
FROM students_temp s;

DROP TABLE students_temp;

.import csv/s2/roster-p7.csv students_temp

INSERT INTO students (name, period, school_id, user_id, grade, gender, student_email, semester) 
SELECT 
    s.student,
    '7',
    s.student_id,
    s.user_id,
    s.grade,
    s.gender,
    s.student_email,
    2
FROM students_temp s;

DROP TABLE students_temp;
