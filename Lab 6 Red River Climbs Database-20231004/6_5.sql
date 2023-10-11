
SELECT climbs.climb_name, climb_grades.grade_str, 
        climbs.climb_len_ft, climbs.crag_name, crags.region_name
    FROM (climbs
        INNER JOIN crags
        USING (crag_name))
    INNER JOIN climb_grades
        ON climbs.climb_grade = climb_grades.grade_id
        WHERE climb_grades.grade_str = '5.9';
    