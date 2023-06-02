CONNECT TO MUSIC

-- Q4)
CREATE OR REPLACE FUNCTION wordfun (input_word VARCHAR(255))
    RETURNS VARCHAR(255)
    LANGUAGE SQL
    BEGIN

    -- Declaring variables and setting default value
    DECLARE final VARCHAR(255);
    DECLARE first_char VARCHAR(1);
    DECLARE vowels CHAR(10) DEFAULT 'AEIOUaeiou';
    
    -- Getting the first character of the input
    SET first_char = SUBSTR(input_word, 1, 1);
    
    -- Checking if first_char exists in vowels
    IF (INSTR(vowels,first_char) > 0) THEN
      SET final = input_word || 'ay';
    ELSE
      SET final = SUBSTR(input_word, 2) || first_char || 'ay';
    END IF;
    
    RETURN final;
END;
