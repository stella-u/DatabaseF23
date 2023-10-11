SELECT DISTINCT climber_first_name, climber_last_name
FROM ((climbers
    INNER JOIN developed_climbs
        ON developed_climbs.climber_id = climbers.climber_id)

    INNER JOIN climbs
        ON developed_climbs.climb_id = climbs.climb_id)

    INNER JOIN crags
        ON climbs.crag_name = crags.crag_name
        WHERE crags.region_name = 'Miller Fork';