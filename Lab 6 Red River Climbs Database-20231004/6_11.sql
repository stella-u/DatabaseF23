SELECT climbers.climber_first_name, climbers.climber_last_name,
    climb_grades.grade_str
    FROM ((developed_climbs
    INNER JOIN climbers
        ON developed_climbs.climber_id = climbers.climber_id)
    INNER JOIN climbs 
        ON climbs.climb_id = developed_climbs.climb_id)
    INNER JOIN climb_grades
        ON climb_grades.grade_id = climbs.climb_grade
        WHERE climb_grades.grade_id = 
            (SELECT MAX(grade_id)
                FROM climb_grades AS cg
                WHERE cg.grade_id = climbs.climb_grade)
    GROUP BY developed_climbs.climber_id;

    /* BAILEY SOLUTION
    SELECT climber_first_name, climber_last_name, grade_str
    FROM (
        SELECT climber_first_name, climber_last_name, MAX(grade_id) AS max_grade
        FROM climbers
        INNER JOIN developed_climbers USING climber_id
        INNER JOIN climbs USING (climb_id)
        INNER JOIN climb_grades ON grade_id = climb_grade
        GROUP BY climber_id
    )
    AS max_grade_subquery
    INNER JOIN climb_grades ON grade_id = max_grade;
    */

