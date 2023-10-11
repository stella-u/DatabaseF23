--USE red_river_climbs;

SELECT climbs.climb_name, sport_climbs.climb_bolts, GROUP_CONCAT(climbers.climber_handle)
FROM (((climbs
    INNER JOIN sport_climbs
        ON sport_climbs.climb_id = climbs.climb_id)
    INNER JOIN first_ascents
        ON first_ascents.climb_id = sport_climbs.climb_id)
    INNER JOIN climbers
        ON climbers.climber_id = first_ascents.climber_id)
GROUP BY climbs.climb_id;

