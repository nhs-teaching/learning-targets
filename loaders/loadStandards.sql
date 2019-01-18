.mode csv
.import csv/standards.csv standards_temp

INSERT INTO learning_targets (student_id, unit, target, date_marked, score, reassess)
SELECT 
    s.id,
    st.unit,
    st.target,
    st.date,
    st.score,
    st.reassess
FROM standards_temp st
INNER JOIN students s ON s.name = st.student;

DROP TABLE standards_temp;
