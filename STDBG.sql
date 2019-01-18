 SELECT
    UPPER(name) as name,
    STDBG(score) as grade,
    PASS_INDEX(score) as pndx
 FROM (
    SELECT 
        s.name,
        s.period,
        lt.unit,
        lt.target,
        lt.score,
        MAX(lt.date_marked) AS date_marked
    FROM 
        learning_targets lt
    LEFT JOIN 
        students s on s.id = lt.student_id
    WHERE
        s.period = ?
    AND
        lt.date_marked <= ?
    GROUP BY 
        lt.student_id,
        lt.unit,
        lt.target
    ORDER BY
        s.name,
        lt.unit,
        lt.target
) 
GROUP BY 
    name
ORDER BY
    name
;
