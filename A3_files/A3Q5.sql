CONNECT TO music USER parth USING "password"

-- Q5)
-- Re-create the userid called dba625b
CREATE USER dba625b USING PASSWORD 'bbbbb'

-- Create a new userid called dba625c
CREATE USER dba625c USING PASSWORD 'ccccc'

-- Create a ROLE called BANDCAN and add dba625b to this role.
CREATE ROLE BANDCAN;
GRANT ROLE BANDCAN TO USER dba625b;

-- Create a ROLE called BANDANA and add dba625c to this role
CREATE ROLE BANDANA;
GRANT ROLE BANDANA TO USER dba625C;

-- BANDCAN role should have read access to bandinfo
GRANT SELECT ON TABLE bandinfo TO ROLE BANDCAN;

-- BANDCAN role should only be allowed to see information from bandinfo table if the BASECOUNTRY column is ‘Canada’
GRANT (SELECT * FROM bandinfo WHERE base_country = 'Canada') ON TABLE bandinfo TO ROLE BANDCAN;

-- BANDANA role should have read access to bandinfo table
GRANT SELECT ON TABLE BANDANA TO ROLE BANDCAN;

- BANDANA role should only see the first letter of GENRE – 
