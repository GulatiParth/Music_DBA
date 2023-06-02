CONNECT TO MUSIC

-- Q5 a)
SELECT 
    JSON_VAL(releases, 'title', 's:50') AS Title,
    JSON_VAL(releases, 'year', 's:50') AS Year,
    JSON_VAL(releases, 'type', 's:50') AS Type
FROM bandinfo
WHERE band_name = 'Imagine Dragons';



-- Q5 b)
CREATE PROCEDURE releaseupd() LANGUAGE SQL MODIFIES SQL DATA
BEGIN

  -- Declaring variables
  DECLARE counter INT;
  DECLARE new_band_name VARCHAR(255);

  -- Variable for loop
  DECLARE at_end INT DEFAULT 0;
  
  -- Cursor to get band_name
  DECLARE C1 C1SOR FOR 
    SELECT band_name 
    FROM bandinfo;

  DECLARE EXIT HANDLER FOR NOT FOUND SET at_end = 1;

  -- Opening the cursor
  OPEN C1;

  SET at_end = 0;

  -- Start of loop
  read_loop: LOOP

    -- Fetching the value 
    FETCH C1 INTO new_band_name;
    IF at_end = 1 THEN
      LEAVE read_loop;
    END IF;

    -- Getting the JSON data
    SELECT counter = COUNT(*)
    FROM JSON_TABLE(
      (SELECT releases FROM bandinfo WHERE band_name = band_name), 
      '$[*]' COLUMNS (
        title VARCHAR(50) PATH '$.title',
        type VARCHAR(50) PATH '$.type',
        year INT PATH '$.year'
      )
    ) AS band;

    -- Updating the number of releases to the counter
    UPDATE bandinfo
    SET num_releases = counter
    WHERE band_name = new_band_name;

  -- End of loop
  END LOOP;

  -- Closing the cursor
  CLOSE C1;
END;
