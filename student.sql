.mode columns
.header on

SELECT 
    name,
    period,
    unit, 
    target,
    score,
    MAX(date(date_marked))
FROM learning_targets lt
INNER JOIN students s ON s.id = lt.student_id
WHERE 
    name like '%'
GROUP BY 
    unit, target
;
