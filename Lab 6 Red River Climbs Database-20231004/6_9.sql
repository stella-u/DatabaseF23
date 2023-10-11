SELECT climb_grades.grade_str, COUNT(climbs.climb_id)
FROM climb_grades
    LEFT OUTER JOIN climbs
    ON climb_grades.grade_id = climbs.climb_grade
GROUP BY climb_grades.grade_id;
