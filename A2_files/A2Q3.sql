CONNECT TO MUSIC

-- Q3 a)
INSERT INTO bandmembers (band_name, last_name, first_name, role, start_year, end_year)
VALUES ('Radiohead', 'Greenwood', 'Jonny', 'Guitarist', '1985-01-01', '9999-12-31'),
       ('Radiohead', 'Brien', 'Ed', 'Guitarist', '1985-01-01', '9999-12-31'),
       ('Radiohead', 'Yorke', 'Thom', 'Lead vocalist', '1985-01-01', '9999-12-31'),
       ('Radiohead', 'Selway', 'Phil', 'Drummer', '1985-01-01', '9999-12-31'),
       ('Radiohead', 'Colin', 'Philip', 'Bassist', '1985-01-01', '9999-12-31'),
       ('Radiohead', 'Smith', 'Clive', 'Drummer', '1996-01-01', '2001-12-31'),
       ('Radiohead', 'Rolph', 'Stuart', 'Drummer', '2002-01-01', '2004-12-31'),  
       ('The XX', 'Sim', 'Oliver', 'Guitarist', '2005-01-01', '9999-12-31'),
       ('The XX', 'Smith', 'Romy', 'Lead vocalist', '2005-01-01', '9999-12-31'),
       ('The XX', 'Croft', 'Baria', 'Lead vocalist', '2005-01-01', '9999-12-31'),
       ('The XX', 'Medley', 'Jamie', 'Drummer', '2009-01-01', '2010-12-31'),
       ('The XX', 'West', 'Leif', 'Drummer', '2011-01-01', '2012-12-31'),  
       ('The Killers', 'Flowers', 'Brandon', 'Lead vocalist', '2001-01-01', '9999-12-31'),
       ('The Killers', 'Keuning', 'Dave', 'Guitarist', '2001-01-01', '9999-12-31'),
       ('The Killers', 'Vannucci', 'Ronnie', 'Drummer', '2001-01-01', '9999-12-31'),
       ('The Killers', 'Bell', 'Mark', 'Bassist', '2001-01-01', '9999-12-31'),
       ('The Killers', 'Jordan', 'Matt', 'Drummer', '2004-01-01', '2006-12-31'),
       ('The Killers', 'Wagner', 'Teddy', 'Drummer', '2007-01-01', '2009-12-31'),  
       ('The Strokes', 'Casablancas', 'Julian', 'Lead vocalist', '1998-01-01', '2022-12-31'),
       ('The Strokes', 'Moretti', 'Fab', 'Drummer', '1998-01-01', '2022-12-31'),
       ('The Strokes', 'Hammond', 'Albert', 'Guitarist', '1998-01-01', '2022-12-31'),  
       ('Coldplay', 'Martin', 'Chris', 'Lead vocalist', '1998-06-01', '9999-12-31'),
       ('Coldplay', 'Berryman', 'Guy', 'Bassist', '1998-06-01', '9999-12-31'),
       ('Coldplay', 'Champion', 'Will', 'Drummer', '1998-06-01', '9999-12-31'),
       ('Coldplay', 'Buckland', 'Jonny', 'Guitarist', '1998-06-01', '9999-12-31'),
       ('Coldplay', 'Buckland', 'Jonny', 'Guitarist', '2000-01-01', '2006-12-31'),
       ('Coldplay', 'Champion', 'Will', 'Drummer', '2007-01-01', '9999-12-31'),
       ('Coldplay', 'Berryman', 'Guy', 'Bassist', '2010-01-01', '9999-12-31');

-- Turn on interactive mode
SET SERVEROUTPUT ON

-- Asking for a band name as an input
CREATE OR REPLACE PROCEDURE bandhistory (IN input_band_name VARCHAR(255))
READS SQL DATA
LANGUAGE SQL
BEGIN

    -- Declaring variables
    DECLARE n_last VARCHAR(255);
    DECLARE n_first VARCHAR(255);
    DECLARE n_role VARCHAR(255);
    DECLARE n_start DATE;
    DECLARE n_end DATE;
	
    -- This is a counter for the while loop
    DECLARE not_found CONDITION FOR SQLSTATE '02000';    
    DECLARE at_end INT DEFAULT 0;
    
    -- Declaring  a cursor for multi-row result from bandmembers
    DECLARE C1 CURSOR FOR
        SELECT last_name, first_name, role, start_year, end_year
        FROM bandmembers
        WHERE band_name = input_band_name
        ORDER BY start_year;
        
    -- Declare the condition handler for reaching the end of the result set
    DECLARE CONTINUE HANDLER FOR not_found SET at_end = 1;        

    -- Displaying the title on top
    CALL DBMS_OUTPUT.PUT_LINE('Band Member History for band: '|| input_band_name);

    -- Opening the cursor 
    OPEN C1;

    -- Fetching the values into the variables
    FETCH C1 INTO n_last, n_first, n_role, n_start, n_end;

    -- while there is data in the result, set continue to loop
    WHILE at_end = 0 DO
        CALL DBMS_OUTPUT.PUT_LINE(n_first || '   ' || n_last || '   ' || n_role || '    ' || n_start || '   ' || n_end);
    
    -- fetching the new row
    FETCH C1 INTO n_last, n_first, n_role, n_start, n_end;

    -- End of while loop
    END WHILE;

    -- Closing the cursor
    CLOSE C1;
END;



-- Q3 b)
CREATE OR REPLACE PROCEDURE bandyear (IN input_band_name VARCHAR(255), IN input_year INT)
READS SQL DATA
LANGUAGE SQL
BEGIN

    -- Declaring variables
    DECLARE n_last VARCHAR(255);
    DECLARE n_first VARCHAR(255);
    DECLARE n_role VARCHAR(255);
    DECLARE n_start DATE;
    DECLARE n_end DATE;
    
    -- This is a counter for the while loop
    DECLARE at_end INT DEFAULT 0;
    DECLARE not_found CONDITION FOR SQLSTATE '02000';

    DECLARE at_end INT DEFAULT 0;
    

    -- Declaring  a cursor for multi-row result from bandmembers
    DECLARE C1 CURSOR FOR
        SELECT last_name, first_name, role, start_year, end_year
        FROM bandmembers 
        FOR BUSINESS_TIME AS OF '01-JAN-' + CAST(input_year AS VARCHAR(4))
        WHERE band_name = input_band_name
        ORDER BY start_year;
        
    -- Declare the condition handler for reaching the end of the result set
    DECLARE CONTINUE HANDLER FOR not_found SET at_end = 1;        

    CALL DBMS_OUTPUT.PUT_LINE('Band Member List for band: '|| input_band_name || ' on January 1, ' || input_year);
    
    -- Opening the cursor
    OPEN C1;

    -- Fetching the values into the variables
    FETCH C1 INTO n_last, n_first, n_role, n_start, n_end;

    -- while there is data in the result, set continue to loop
    WHILE at_end = 0 DO
        CALL DBMS_OUTPUT.PUT_LINE(n_first || '   ' || n_last || '   ' || n_role || '    ' || n_start || '   ' || n_end);
    
    -- fetching the new row
    FETCH C1 INTO n_last, n_first, n_role, n_start, n_end;
    END WHILE;
  
    -- Closing the cursor
    CLOSE C1;
END;
