-- Parth Gulati


-- 1)
CREATE DATABASE music

CONNECT TO music

CREATE TABLE bandinfo (
    band_name VARCHAR(255) NOT NULL,
    formation_year INTEGER NOT NULL,
    current_status VARCHAR(8) NOT NULL,
    base_city VARCHAR(255) NOT NULL,
    base_country VARCHAR(255) NOT NULL,
    number_of_band_members INTEGER NOT NULL,
    number_of_releases INTEGER NOT NULL,
    genre VARCHAR(255) NOT NULL
);

INSERT INTO bandinfo (band_name, formation_year, current_status, base_city, base_country, number_of_band_members, number_of_releases, genre)
VALUES ('The 1975', 2002, 'Active', 'Manchester', 'United Kingdom', 4, 5, 'Indie Rock'),
       ('Twenty One Pilots', 2009, 'Active', 'Columbus', 'USA', 2, 5, 'Alternative'),
       ('Imagine Dragons', 2008, 'Active', 'Las Vegas', 'USA', 4, 4, 'Alternative Rock'),
       ('Arctic Monkeys', 2002, 'Active', 'Sheffield', 'United Kingdom', 4, 6, 'Indie Rock'),
       ('Foo Fighters', 1994, 'Active', 'Seattle', 'USA', 4, 10, 'Rock'),
       ('Coldplay', 1996, 'Active', 'London', 'United Kingdom', 4, 8, 'Alternative Rock'),
       ('The Strokes', 1998, 'Active', 'New York City', 'USA', 5, 6, 'Indie Rock'),
       ('Green Day', 1986, 'Active', 'Oakland', 'USA', 3, 13, 'Punk Rock'),
       ('Muse', 1994, 'Active', 'Teignmouth', 'United Kingdom', 3, 8, 'Alternative Rock'),
       ('Red Hot Chili Peppers', 1983, 'Active', 'Los Angeles', 'USA', 4, 11, 'Alternative Rock'),
       ('The Black Keys', 2001, 'Active', 'Akron', 'USA', 2, 9, 'Blues Rock'),
       ('Radiohead', 1985, 'Active', 'Oxford', 'United Kingdom', 5, 9, 'Alternative Rock'),
       ('Tame Impala', 2007, 'Active', 'Perth', 'Australia', 1, 4, 'Psychadelic Rock'),
       ('The Killers', 2001, 'Active', 'Las Vegas', 'USA', 4, 5, 'Indie Rock'),
       ('Foster The People', 2009, 'Active', 'Los Angeles', 'USA', 3, 3, 'Indie Pop'),
       ('The Lumineers', 2002, 'Active', 'Denver', 'USA', 3, 3, 'Folk Rock'),
       ('Vampire Weekend', 2006, 'Active', 'New York City', 'USA', 4, 4, 'Indie Rock'),
       ('The XX', 2005, 'Active', 'London', 'United Kingdom', 3, 4, 'Indie Pop'),
	 ('The Chainsmokers', 2012, 'Active', 'New York City', 'USA', 2, 2, 'EDM'),
       ('Panic! At The Disco', 2004, 'Active', 'Las Vegas', 'USA', 3, 6, 'Pop Rock');


SELECT * FROM bandinfo;





-- 2)
CREATE TABLE bandrecognition (
    band_name VARCHAR(255) NOT NULL,
    award VARCHAR(255) NOT NULL,
    nomination CHAR(1) NOT NULL,
    year INTEGER NOT NULL
);

INSERT INTO bandrecognition (band_name, award, nomination, year)
VALUES ('The 1975', 'Grammy Award for Best Rock Album', 'N', 2020),
       ('Twenty One Pilots', 'Billboard Music Award for Top Rock Artist', 'A', 2020),
       ('Imagine Dragons', 'MTV Europe Music Award for Best UK/Ireland Act', 'N', 2021),
       ('Imagine Dragons', 'American Music Award for Favorite Alternative Artist', 'A', 2014),
       ('Imagine Dragons', 'Grammy Award for Best Rock Performance', 'N', 2019),
       ('Coldplay', 'MTV Video Music Award for Best Special Effects', 'N', 2017),
       ('The Strokes', 'NME Award for Best Album', 'N', 2021),
       ('Twenty One Pilots', 'American Music Award for Favorite Pop/Rock Duo or Group', 'N', 2017),
       ('Muse', 'Q Award for Best Live Act', 'A', 2010),
       ('Vampire Weekend', 'Grammy Award for Best Alternative Music Album', 'N', 2022),
       ('The Black Keys', 'Grammy Award for Best Rock Performance', 'A', 2013),
       ('Radiohead', 'MTV Video Music Award for Best Art Direction', 'N', 2016),
       ('Tame Impala', 'ARIA Music Award for Best Group', 'A', 2021),
       ('The Killers', 'Grammy Award for Best Rock Album', 'N', 2019),
       ('The Killers', 'BRIT Award for International Group', 'N', 2022),
       ('The Lumineers', 'iHeartRadio Music Award for Best Alternative Rock Artist', 'N', 2018),
       ('Vampire Weekend', 'MTV Video Music Award for Best Art Direction', 'N', 2013),
       ('The Chainsmokers', 'iHeartRadio Music Award for Dance/EDM Song of the Year', 'N', 2018),
       ('The Chainsmokers', 'Billboard Music Award for Top Dance/Electronic Artist', 'N', 2020),
       ('The Chainsmokers', 'Grammy Award for Best Dance Recording', 'N', 2020);


SELECT * FROM bandrecognition;






-- 3) 
ALTER TABLE bandinfo ADD COLUMN releases CLOB;


UPDATE bandinfo
SET releases = '{
    "releases": [
        {
            "type": "album",
            "year": 2013,
            "title": "The 1975"
        },
        {
            "type": "album",
            "year": 2016,
            "title": "I Like It When You Sleep"
        },
        {
            "type": "album",
            "year": 2018,
            "title": "A Brief Inquiry"
        }
    ]
}'
WHERE band_name = 'The 1975';


UPDATE bandinfo
SET releases = '{
    "releases": [
        {
            "type": "album",
            "year": 2012,
            "title": "Night Visions"
        },
        {
            "type": "album",
            "year": 2018,
            "title": "Origins"
        }
    ]
}'
WHERE band_name = 'Imagine Dragons';


UPDATE bandinfo
SET releases = '{
    "releases": [
        {
            "type": "album",
            "year": 2016,
            "title": "Memories...Do Not Open"
        },
        {
            "type": "album",
            "year": 2018,
            "title": "Sick Boy"
        },
    ]
}'
WHERE band_name = 'The Chainsmokers';


UPDATE bandinfo
SET releases = '{
    "releases": [
        {
            "type": "album",
            "year": 1994,
            "title": "Dookie"
        },
        {
            "type": "album",
            "year": 2016,
            "title": "Revolution Radio"
        }
    ]
}'
WHERE band_name = 'Green Day';



UPDATE bandinfo
SET releases = '{
    "releases": [
        {
            "type": "album",
            "year": 2006,
            "title": "Whatever People Say I Am"
        }
    ]
}'
WHERE band_name = 'Arctic Monkeys';


SELECT band_name, releases FROM bandinfo;;





-- 4)
CREATE TABLE bandmembers (
    band_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    band_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    start_year DATE NOT NULL,
    end_year DATE NOT NULL DEFAULT '9999-12-31',
    PERIOD BUSINESS_TIME (start_year,end_year),
    PRIMARY KEY(band_id,BUSINESS_TIME WITHOUT OVERLAPS)
);


INSERT INTO bandmembers (band_name, last_name, first_name, role, start_year)
VALUES ('Imagine Dragons', 'Reynolds', 'Dan', 'Lead vocalist', '2012-01-01'),
       ('Imagine Dragons', 'Sermon', 'Wayne', 'Bassist', '2011-01-01'),
       ('Imagine Dragons', 'Maddock', 'Ben', 'Drummer', '2011-01-01'),
       ('Imagine Dragons', 'Ivanoff', 'Daniel', 'Guitarist', '2011-01-01'),
       ('The Chainsmokers', 'Taggart', 'Andrew', 'DJ', '2012-01-01'),
       ('The Chainsmokers', 'Pall', 'Alex', 'DJ', '2012-01-01'),
       ('Arctic Monkeys', 'Turner', 'Alex', 'Lead vocalist', '2002-01-01'),
       ('Arctic Monkeys', 'O´Malley', 'Jamie', 'Guitarist', '2002-01-01'),
       ('Arctic Monkeys', 'Holden', 'Nick', 'Bassist', '2002-01-01'),
       ('Arctic Monkeys', 'Cook', 'Matt', 'Drummer', '2002-01-01'),
       ('The 1975', 'Healy', 'Matthew', 'Lead vocalist', '2012-01-01'),
       ('The 1975', 'Daniel', 'Adam', 'Drummer', '2012-01-01'),
       ('The 1975', 'Tobin', 'George', 'Bassist', '2012-01-01'),
       ('The 1975', 'Hanley', 'Ross', 'Keyboardist', '2012-01-01'),
       ('Twenty One Pilots', 'Joseph', 'Tyler', 'Lead vocalist', '2009-01-01'),
       ('Twenty One Pilots', 'Salih', 'Josh', 'Drummer', '2009-01-01'),
       ('Twenty One Pilots', 'Trench', 'Nick Thomas', 'Bassist', '2011-01-01'),
       ('Twenty One Pilots', 'Fairchild', 'Chris', 'Keyboardist', '2011-01-01');
      
SELECT * FROM bandmembers;
