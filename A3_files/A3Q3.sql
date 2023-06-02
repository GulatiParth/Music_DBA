
CREATE TABLE bandaudit ( 
	tblnm VARCHAR(60) NOT NULL,
	tblops CHAR(1) NOT NULL,
	tbldttm TIMESTAMP
);


-- Q3)
CREATE OR REPLACE TRIGGER bandrecognition_audit_trigger

    -- trigger when we insert,update or delete on bandrecognition table
    AFTER INSERT OR UPDATE OR DELETE ON bandrecognition
    
    -- action happens on each row
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            INSERT INTO bandaudit (tblnm, tblops, tbldttm)
            VALUES ('bandrecognition', 'I', CURRENT TIMESTAMP);
        ELSEIF UPDATING THEN
            INSERT INTO bandaudit (tblnm, tblops, tbldttm)
            VALUES ('bandrecognition', 'U', CURRENT TIMESTAMP);
        ELSEIF DELETING THEN
            INSERT INTO bandaudit (tblnm, tblops, tbldttm)
            VALUES ('bandrecognition', 'D', CURRENT TIMESTAMP);
        END IF;
    END;


CREATE OR REPLACE TRIGGER bandinfo_audit_trigger

    -- trigger when we insert,update or delete on bandinfo table
    AFTER INSERT OR UPDATE OR DELETE ON bandinfo
    
    -- action happens on each row
    FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            INSERT INTO bandaudit (tblnm, tblops, tbldttm)
            VALUES ('bandinfo', 'I', CURRENT TIMESTAMP);
        ELSEIF UPDATING THEN
            INSERT INTO bandaudit (tblnm, tblops, tbldttm)
            VALUES ('bandinfo', 'U', CURRENT TIMESTAMP);
        ELSEIF DELETING THEN
            INSERT INTO bandaudit (tblnm, tblops, tbldttm)
            VALUES ('bandinfo', 'D', CURRENT TIMESTAMP);
        END IF;
    END;

