SELECT climb_grades.grade_str, GROUP_CONCAT(climbs.climb_name)
FROM climbs
    LEFT OUTER JOIN climb_grades
    ON climb_grades.grade_id = climbs.climb_grade
GROUP BY climb_grades.grade_id;