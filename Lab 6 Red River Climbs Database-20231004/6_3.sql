
SELECT climbs.climb_name, climb_grades.grade_str
FROM (climbs
    INNER JOIN climb_grades
        ON climbs.climb_grade = climb_grades.grade_id)
    INNER JOIN sport_climbs
        USING (climb_id)
        WHERE crag_name = 'Slab City';

    