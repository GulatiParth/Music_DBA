CONNECT TO MUSIC

-- Q1 a)
-- In my A1, I already created all the tables with NOT NULL constraint which makes the fields mandatory to have some value in them.


-- Q1 b)
-- In my A1, I already have my bandmembers table to have '9999-12-31' as a DEFAULT value for end_year column. 
-- If I need to change it to '9999', I will run " ALTER TABLE bandmembers ALTER COLUMN end_year SET DEFAULT '9999' "
-- but for A2, I am not changing it from '9999-12-31' as it also represents the maximum date value.
-- For any comparison bewteen different years and dates, I will be casting one field to other.
-- I will be happy to change it if needed later.


-- Q1 c)
-- Making "band_name" column in bandinfo table as a primary key
ALTER TABLE bandinfo
ADD PRIMARY KEY (band_name);


-- Here I added a Foreign key constraint name "fkey_bandmembers_bandinfo" to bandmembers table on band_name column
-- by referencing to bandinfo's band_name. On delete cascade ensures to delete all records in the child table if I 
-- delete the record in parent table. 
ALTER TABLE bandmembers
ADD CONSTRAINT fkey_bandmembers_bandinfo
FOREIGN KEY (band_name) REFERENCES bandinfo (band_name)
ON DELETE CASCADE;


-- Here I added a Foreign key constraint name "fkey_bandrecognition_bandinfo" to bandrecognition table on band_name column
-- by referencing to bandinfo's band_name. On delete cascade ensures to delete all records in the child table if I 
-- delete the record in parent table. 
ALTER TABLE bandrecognition
ADD CONSTRAINT fkey_bandrecognition_bandinfo
FOREIGN KEY (band_name) REFERENCES bandinfo (band_name)
ON DELETE CASCADE;


-- Q1 d)
-- Added a constraint so that the formation year of the band can only be between 1950 and 2050.
ALTER TABLE bandinfo
ADD CONSTRAINT check_formation_year
CHECK (formation_year >= 1950 AND formation_year <= 2050);


-- Added a constraint so that the status of the band can only be 'Active' or 'Inactive'.
ALTER TABLE bandinfo
ADD CONSTRAINT check_current_status
CHECK (current_status IN ('Active', 'Inactive'));


-- Added a constraint so that the number of releases by the band needs to be 0 or higher. (0 for bands which are just formed but havent released a music yet).
ALTER TABLE bandinfo
ADD CONSTRAINT check_number_of_releases
CHECK (number_of_releases >= 0);


-- Added a constraint so that the number of band members needs to be 1 or higher.
ALTER TABLE bandinfo
ADD CONSTRAINT check_number_of_band_members
CHECK (number_of_band_members >= 1);


-- Added a constraint so that the genre of the band can only be one from the list. New values of genre type can also be added later.
ALTER TABLE bandinfo
ADD CONSTRAINT check_genre
CHECK (genre IN ('Indie Rock', 'Alternative', 'Alternative Rock', 'Rock', 'Punk Rock', 'Blues Rock', 'Psychadelic Rock', 'Folk Rock','EDM','Pop Rock','Jazz','Hip Hop','Metal','Classical','Indie Pop'));



-- Q1 e)
-- Added a constraint so that the nomination value can only be 'A' for Awarded or 'N' for Nominated.
ALTER TABLE bandrecognition
ADD CONSTRAINT check_nomination
CHECK (nomination IN ('A', 'N'));


-- Added a constraint so that the year can only be between 1950 to 2050.
ALTER TABLE bandrecognition
ADD CONSTRAINT check_year
CHECK (year >= 1950 AND year <= 2050);



-- Q1 f)
-- Added a constraint so that the start year can only be between 1950-01-01 to 2050-12-31.
ALTER TABLE bandmembers 
ADD CONSTRAINT check_start_year 
CHECK (start_year >= '1950-01-01' AND start_year <= '2050-12-31');


-- Added a constraint so that the end year can only be between 1950-01-01 to 9999-12-31 which is the default value assigned to this column.
ALTER TABLE bandmembers 
ADD CONSTRAINT check_end_year
CHECK (end_year >= '1950-01-01' AND end_year <= '9999-12-31');


-- Added a constraint so that the role can only be one out of the list.
ALTER TABLE bandmembers 
ADD CONSTRAINT check_role
CHECK (role IN ('Bassist', 'Guitarist', 'Drummer', 'Guitar', 'Keyboardist', 'Piano', 'Saxophone', 'Violin', 'Lead vocalist', 'DJ'));


-- Q1 g)
CREATE TRIGGER bandmemnum

    -- Trigger made for both insert and delete
    AFTER INSERT OR DELETE 
    ON bandmembers
    -- New refered as n and old refered as o
    REFERENCING NEW AS n OLD as o
    -- affects each row
    FOR EACH ROW

-- Beginning of the trigger logic    
BEGIN

  -- This triggers if 'INSERTING' happends and adds 1 to number_of_band_members
  IF (INSERTING) THEN
    UPDATE bandinfo SET number_of_band_members = number_of_band_members + 1
    WHERE band_name = n.band_name;
    
  -- This triggers if 'DELETING' happends and subtracts 1 to number_of_band_members
  ELSEIF (DELETING) THEN
    UPDATE bandinfo SET number_of_band_members = number_of_band_members - 1
    WHERE band_name = o.band_name;
    
  END IF;  
END;


-- Q1 h)
CREATE TRIGGER bandmemstart

    -- Trigger for both insert and update
    AFTER INSERT OR UPDATE
    ON bandmembers
    -- New refered as n
    REFERENCING NEW AS n
    -- affects each row
    FOR EACH ROW

BEGIN

    -- Declare required variables
    DECLARE new_formation_year INTEGER;

    -- Declare error handling for situation where start year is before formation year    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Start Year cannot be before the Band Formation Year';
    
    -- Perform the SELECT statement to gethe formation year into our newly created variable
    SELECT formation_year INTO new_formation_year
    FROM bandinfo
    WHERE band_name = n.band_name;
	
    -- start_year is DATE and formation_year and new_formation_year are INTEGER so we need to cast one value to other. Therefor used year().
    IF (year(n.start_year) < new_formation_year) THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Band Member Start Year cannot be before the Band Formation Year';
    END IF;
END;
