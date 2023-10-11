
SELECT climbs.climb_name, climb_grades.grade_str
    FROM (climbs
        INNER JOIN climb_grades
        ON climbs.climb_grade = climb_grades.grade_id)
    INNER JOIN trad_climbs
        ON trad_climbs.climb_id = climbs.climb_id
    