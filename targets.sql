SELECT 
    UPPER(name) as name,
    score,
    MAX(lt.date_marked) as date_marked,
    COUNT(lt.date_marked) as attempts
FROM 
    learning_targets lt
INNER JOIN 
    students s ON s.id = lt.student_id
WHERE 
    s.period = ? AND s.semester = ? AND lt.unit = ? AND lt.target = ? AND lt.date_marked <= ?
GROUP BY 
    lt.student_id
ORDER BY 
    name ASC
;
