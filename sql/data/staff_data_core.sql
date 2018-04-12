-- Staff Data Core, Verson 1.0.0, MAR18, JPGalovic
-- Staff Table
CREATE TABLE IF NOT EXISTS STAFF (
		STAFF_NAME						VARCHAR(200)
	,	EMAIL							VARCHAR(200)
	,	MOBILE_NUMBER					VARCHAR(15)
	,	STUDENT_ID						VARCHAR(15)
	,	DISCORD_USER					VARCHAR(100)
	,	EVENT_SUPER						BOOLEAN
	,	MARKETING_TEAM					BOOLEAN
	,	WEBKIT							BOOLEAN
	,	GAME_MASTER						BOOLEAN
	,	PRIMARY KEY						(STAFF_NAME)
);

-- Emergancy Contacts Table
CREATE TABLE IF NOT EXISTS STAFF_EMERGANCY_CONTACTS (
		STAFF_NAME						VARCHAR(200)
	,	CONTACT_NAME					VARCHAR(200)
	,	CONTACT_RELATION				VARCHAR(200)
	,	PRIMARY_CONTACT_NUMBER			VARCHAR(15)
	,	SECONDARY_CONTACT_NUMBER		VARCHAR(15)
	,	PRIMARY KEY						(STAFF_NAME, CONTACT_NAME)
	,	FOREIGN KEY						(STAFF_NAME) REFERENCES STAFF (STAFF_NAME)
);