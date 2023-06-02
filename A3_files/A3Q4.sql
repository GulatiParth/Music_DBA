
-- Q4)
-- Creating a local keystore
gsk8capicmd_64 -keydb -create -db "C:\Users\parth\OneDrive\Des\a3_dba\keystore\keystore.p12" -pw "Parth@123" -type pkcs12 -stash


-- Configuring music to use a keystore
update dbm cfg using keystore_location C:\Users\parth\OneDrive\Des\a3_dba\keystor\keystore.p12 keystore_type pkcs12


-- backing up the current music database (without encrypt)
BACKUP DB music TO C:\Users\parth\OneDrive\Desktop\a3_dba\music_backup


-- Dropping the databse
drop database music


-- resotoring the database with with a encrypt
RESTORE DB music FROM C:\Users\parth\OneDrive\Desktop\a3_dba\music_backup\MUSIC.0.DB2.DBPART000.20230228104718 ENCRYPT
