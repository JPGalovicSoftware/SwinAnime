-- Table for Event Type
CREATE TABLE IF NOT EXISTS EVENT_TYPE (
		EVENT_TYPE_ID					INT(11)
	,	EVENT_TYPE_DESCRIPTION			VARCHAR(100)
	,	PRIMARY KEY						(EVENT_TYPE_ID)
);

-- Data for Event Type
INSERT INTO EVENT_TYPE (EVENT_TYPE_ID, EVENT_TYPE_DESCRIPTION) VALUES
		(0, "Screening Session Event")
	,	(1, "Social Episode Event")
	,	(2, "Workshop Event")
	,	(3, "General Meeting")
;

-- Table for Event Locations
CREATE TABLE IF NOT EXISTS EVENT_LOCATION (
		LOCATION_ID						INT(11)
	,	CAMPUS							VARCHAR(30)
	,	ROOM							VARCHAR(10)
	,	ADDRESS							VARCHAR(150)
	,	LAT								FLOAT(53)
	,	LNG								FLOAT(53)
	,	ZOOM							INT(11)
	, 	PRIMARY KEY						(LOCATION_ID)
);

-- Data for Event Locations
INSERT INTO EVENT_LOCATION (LOCATION_ID, CAMPUS, ROOM, ADDRESS, LAT, LNG, ZOOM) VALUES
		(0, "Swinburne Hawthorn", NULL, "John St, Hawthorn VIC 3122", -37.822097, 145.038946, 17)
	,	(1, NULL, NULL, "Crown Entertainment Complex, 8 Whiteman St, Southbank VIC 3006", -37.824871, 144.958181, 17)
	,	(2, NULL, NULL, "Sorrento Oceach Beach, Ocean Beach Road, Sorrento VIC 3943", -38.345876, 144.727014, 17)
	,	(3, NULL, NULL, "Hawthorn Aquatic &amp; Leasure Center, 1 Grace St, Hawthorn VIC 3122", -37.820791, 145.034434, 17)
	
	
	,	(404, "Swinburne Hawthorn", "AS404", "Applied Sciences Building, Burwood Road, Hawthorn Victoria 3122", -37.822571, 145.037619, 17)
;

-- Table for Event Details (MISC)
CREATE TABLE IF NOT EXISTS EVENT_DETAILS(
		EVENT_TITLE						VARCHAR(100)
	,	EVENT_DESCRIPTION				VARCHAR(500)
	,	MEETUP_INSTRUCTIONS				VARCHAR(500)
	,	TICKETS							VARCHAR(500)
	,	PRIMARY KEY						(EVENT_TITLE)
);

-- Screening Session Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("Summer Sessions",
		 "Our Summer Screenings bring unique and special series for our most dedicated members.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("Summer After Dark",
		 "Extra Summer Screening Session, only for out most dedicated members.",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("Summer Showcase",
		 "Summer Edition of our Showcase Screenings, each week showing the first episode of anime avalible to watch now!",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("Screening Sessions",
		 "Our regular screening sessions, brining you smash hit series shown in full over a three week period.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("SwinAnime After Dark",
		 "Extra Screening Sessions, only for our most dedicated members",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("SwinAnime Showcase",
		 "Showcase Screenings, each week showing the first episode of anime avalible to watch now!",
	 	 "Event is open to all, just come along and scan your membership card as you enter.",
	 	 NULL
		)
	,	("Winter Sessions",
		 "Our Winter Screenings bring unique and special series for our most dedicated members.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("Winter After Dark",
		 "Extra Winter Screening Session, only for out most dedicated members.",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("Winter Showcase",
		 "Winter Edition of our Showcase Screenings, each week showing the first episode of anime avalible to watch now!",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
;

-- Social Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES	
		("Beach Episode",
		 "Our Annual trip to the beach, fun with friends, building sand castles, have a swim or a surf, maby evan smash a melon or two.",
		 "Meet at Frankston Train Station for start of event, catching 788 bus to Sorrento. <br>Note: Sorrento is in zone 4, so miki fares are $3.36 concession or $6.72 full fare.",
		 "Event is free to attend, however generally we all pitch in on getting snacks and drinks for the group."
		)
	,	("Arcade Episode",
		 "Play some arcade games, have some fun.",
		 "Meet at Southern Cross Station (Spenser Street), Catching tram 12, 96 or 109 to Crown Casino.",
		 "Event is free to attend, paying what you can afford to play, reocmmended buget is $20-$40"
		)
	,	("Pool Episode",
		 "Our annual trip to the pool, swiming, swiming, swiming...",
		 "Meet at Glenferrie Station, walk across road to pool.",
		 "Event is free to attend, entry to pool is free for current swinburne students."
		)
;

-- Table for Basic Event Data
CREATE TABLE IF NOT EXISTS EVENT_DATA (
		EVENT_TIME						DATETIME
	,	EVENT_TYPE_ID					INT(11)
	,	EVENT_TITLE						VARCHAR(100)
	,	EVENT_LOCATION					INT(11)
	,	EVENT_FACEBOOK_ID				VARCHAR(20)
	,	EVENT_UNIONE_URL				VARCHAR(250)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TYPE_ID) REFERENCES EVENT_TYPE (EVENT_TYPE_ID)
	,	FOREIGN KEY						(EVENT_LOCATION) REFERENCES EVENT_LOCATION (LOCATION_ID)
	,	FOREIGN KEY						(EVENT_TITLE) REFERENCES EVENT_DETAILS (EVENT_TITLE)
);

-- Table for Anime Events
CREATE TABLE IF NOT EXISTS EVENT_ANIME_DATA (
		EVENT_TIME						DATETIME
	,	ANIME_TITLE						VARCHAR(100)
	,	SESSION_TYPE_ID					INT(11)
	,	SESSION_NUMBER					INT(11)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TIME) REFERENCES EVENT_DATA (EVENT_TIME)
	,	FOREIGN KEY						(ANIME_TITLE) REFERENCES ANIME (ANIME_TITLE)
	,	FOREIGN KEY						(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) REFERENCES ANIME_SESSION (ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER)
);

-- Table for Game Events
CREATE TABLE IF NOT EXISTS EVENT_GAME_DATA (
		EVENT_TIME						DATETIME
	,	GAME_TITLE						VARCHAR(100)
	,	GAME_EVENT_TYPE					INT(11)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TIME) REFERENCES EVENT_DATA (EVENT_TIME)
	,	FOREIGN KEY						(GAME_TITLE) REFERENCES GAME (GAME_TITLE)
	,	FOREIGN KEY						(GAME_EVENT_TYPE) REFERENCES GAME_EVENT_TYPE (TYPE_ID)
);

