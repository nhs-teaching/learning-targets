.header on
.mode csv

SELECT unit || target as target, score, count(score) as count
FROM (
    SELECT unit as unit, target, score, MAX(date_marked)
    FROM learning_targets
    INNER JOIN students on students.id = learning_targets.student_id
    WHERE unit = 1 AND target IN ('a', 'b', 'c', 'd', 'e', 'f') AND students.period = 7
    GROUP BY student_id, unit, target
)
GROUP BY score, unit, target
ORDER BY unit, target
;
