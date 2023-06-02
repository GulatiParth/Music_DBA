CONNECT TO music USER parth USING "password"

-- Q1)
-- Give this user read access to the entire database
GRANT SELECT ON DATABASE music TO USER dba625a;


-- Give this user write access only to the bandrecognition table
GRANT INSERT, UPDATE, DELETE ON bandrecognition TO USER dba625a;


-- Give this user the ability create views
GRANT CREATE VIEW ON DATABASE music TO USER dba625a;

 
-- This user should not have the ability to create any other objects
REVOKE CREATETAB,CREATETS ON DATABASE music FROM USER dba625a;

