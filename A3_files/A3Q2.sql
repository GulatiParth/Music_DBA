CONNECT TO music USER parth USING "password"

-- Q2)
CREATE AUDIT POLICY music_audit_pol 
	CATEGORIES EXECUTE STATUS 
	BOTH ERROR TYPE AUDIT;
    
AUDIT TABLE bandrecognition USING POLICY music_audit_pol;


CREATE AUDIT POLICY music_audit_genre 
	CATEGORIES EXECUTE STATUS 
	BOTH ERROR TYPE AUDIT;

AUDIT TABLE bandinfo(genre) USING POLICY music_audit_genre;

