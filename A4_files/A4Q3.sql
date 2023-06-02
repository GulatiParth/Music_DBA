-- Before INSERT,UPDATE and DELETE
SELECT * FROM bandmembers WHERE band_name = 'Imagine Dragons';


-- (I/U/D)
INSERT INTO bandmembers (band_name, last_name, first_name, role, start_year) VALUES ('Imagine Dragons', 'Insert_l1', 'Insert_f1', 'Bassist', '2014-06-05');

INSERT INTO bandmembers (band_name, last_name, first_name, role, start_year) VALUES ('Imagine Dragons', 'Insert_l2', 'Insert_f2', 'DJ', '2016-07-11');

UPDATE bandmembers SET last_name = 'Gulati' WHERE band_name = 'Imagine Dragons' AND first_name = 'Parth';

UPDATE bandmembers SET role = 'DJ' WHERE band_name = 'Imagine Dragons' AND first_name = 'Insert_f1';

DELETE FROM bandmembers WHERE band_name = 'Imagine Dragons' AND first_name = 'Insert_f2';



-- AFTER INSERT,UPDATE and DELETE
SELECT * FROM bandmembers WHERE band_name = 'Imagine Dragons';



-- Restoring the database
DROP DATABASE music;
RESTORE DATABASE music FROM "C:\Users\parth\OneDrive\Desktop\a4_dba" WITHOUT ROLLING FORWARD;



-- AFTER Restoring
SELECT * FROM bandmembers WHERE band_name = 'Imagine Dragons';



