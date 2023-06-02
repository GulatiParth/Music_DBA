CONNECT TO MUSIC


-- Q2 a)
SELECT 
    bif.band_name,
    bif.formation_year,
    bif.current_status,
    bif.base_city,
    count(br.award) AS num_of_nominated_awds
FROM bandinfo bif
INNER JOIN bandrecognition br ON bif.band_name = br.band_name
GROUP BY bif.base_city,bif.band_name, bif.formation_year, bif.current_status
HAVING count(br.award) > 0
ORDER BY num_of_nominated_awds;


-- Q2 b)
SELECT
    bif.band_name,
    bif.formation_year,
    bm.last_name,
    bm.first_name,
    bm.start_year,
    bm.role
FROM bandinfo bif
INNER JOIN bandmembers bm ON bif.band_name = bm.band_name
WHERE bm.end_year > SYSDATE
ORDER BY bif.band_name,bif.formation_year,bm.last_name;
