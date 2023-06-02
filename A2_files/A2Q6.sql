CONNECT TO MUSIC

-- Q6)
CREATE TRIGGER release_update
    -- Trigger for insert and update
    AFTER INSERT OR UPDATE 
    ON bandinfo

    -- New refered as n
    REFERENCING NEW AS n

    -- Action on each row
    FOR EACH ROW
    BEGIN
  
      -- Declaring the variable
      DECLARE counter INT;

      -- Counting the releasese from the JSON data
      SELECT counter = COUNT(*)
      FROM JSON_TABLE(n.releases, '$[*]' COLUMNS(
        title VARCHAR(50) PATH '$.title',
        type VARCHAR(50) PATH '$.type',
        year INT PATH '$.year'
      )) AS band;
    
      -- Updating the number of releases to match the count
      UPDATE bandinfo
      SET num_releases = counter
      WHERE band_name = n.band_name;
END;
