SELECT 
    f.id,
    f.name,
    f.grade,
    f.reassess,
    h.title,
    h.course_id,
    h.grade,
    h.year,
    h.mark
FROM (
    SELECT
	    id,
	    LOWER(name) as name,
	    STDBG(score) as grade,
	    SUM(attempts) as reassess
	 FROM (
	    SELECT 
	        s.id,
	        s.name,
	        s.period,
	        lt.unit,
	        lt.target,
	        lt.score,
	        MAX(lt.date_marked) AS date_marked,
	        (COUNT(*) - 1) as attempts
	    FROM 
	        students s
	    INNER JOIN 
	        learning_targets lt on s.id = lt.student_id
	    WHERE
	        s.period = ?
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
	HAVING
	    STDBG(score) < 70
	ORDER BY
	    name
) f
INNER JOIN course_history h on h.student_id = f.id
WHERE
    h.course_id like 'MA_%'
ORDER BY
    f.name ASC,
    h.year DESC
;
