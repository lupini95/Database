-- Emily Lupini
-- 2 & 3
-- Establishes name as the primary key
CREATE TABLE Countries
	(name VARCHAR(20),
	latitude VARCHAR(10),
	longitude VARCHAR(10),
	area INT,
	population INT,
	gdp FLOAT,	-- In billions
	gdpYear INT,
	PRIMARY KEY (name));

-- 4(a)
-- Establishes the combination of
-- country_a and country_b as the primary key
-- Links country_a and country_b to Countries.name
CREATE TABLE Borders
	(country_a VARCHAR(20),
	country_b VARCHAR(20),
	PRIMARY KEY(country_a, country_b),
	FOREIGN KEY(country_a) REFERENCES Countries(name),
	FOREIGN KEY(country_b) REFERENCES Countries(name));

-- 4(b)
-- GDP represented in billions
INSERT INTO Countries 
VALUES ('Poland', '52 00 N', '20 00 E', 312685, 38476269, 1054.0, 2016),
	('Czech Republic', '49 45 N', '15 30 E', 78867, 10674723, 350.7, 2016),
	('Austria', '47 20 N', '13 20 E', 83871, 8754413, 417.2, 2016),
	('France', '46 00 N', '2 00 E', 643801, 67106161, 2734.0, 2016),
	('Switzerland', '47 00 N', '8 00 E', 41277, 8236303, 496.0, 2016),
	('Germany', '51 00 N', '9 00 E', 357022, 80594017, 3980.0, 2016),
	('Netherlands', '52 30 N', '5 45 E', 41543, 17016967, 869.4, 2016),
	('Belgium', '50 50 N', '4 00 E', 30528, 11491346, 509.5, 2016),
	('Luxembourg', '49 45 N', '6 10 E', 2586, 582291, 59.93, 2016);

-- 4(b) (continued...)
INSERT INTO Borders
VALUES ('Germany', 'Austria'),
 	('Germany', 'Belgium'),
  	('Germany', 'Czech Republic'),
 	('Germany', 'France'),
  	('Germany', 'Luxembourg'),
  	('Germany', 'Netherlands'),
  	('Germany', 'Poland'),
  	('Germany', 'Switzerland');

INSERT INTO Borders
VALUES ('Poland', 'Czech Republic'),
	('Poland', 'Germany');

INSERT INTO Borders
VALUES ('Czech Republic', 'Austria'),
	('Czech Republic', 'Germany'),
	('Czech Republic', 'Poland');

INSERT INTO Borders
VALUES ('Austria', 'Czech Republic'),
	('Austria', 'Germany'),
	('Austria', 'Switzerland');

INSERT INTO Borders
VALUES ('France', 'Belgium'),
	('France', 'Germany'),
	('France', 'Luxembourg'),
	('France', 'Switzerland');

INSERT INTO Borders
VALUES ('Switzerland', 'Austria'),
	('Switzerland', 'France'),
	('Switzerland', 'Germany');

INSERT INTO Borders                                                  
VALUES  ('Netherlands', 'Belgium'),
	('Netherlands', 'Germany');

INSERT INTO Borders
VALUES ('Belgium', 'Germany'),
	('Belgium', 'France'),
	('Belgium', 'Luxembourg'),
	('Belgium', 'Netherlands');

INSERT INTO Borders
VALUES ('Luxembourg', 'Belgium'),
	('Luxembourg', 'France'),
	('Luxembourg', 'Germany');

-- 4(c)
-- Shows all countries bordering Germany
SELECT country_b FROM Borders
WHERE country_a = 'Germany';

-- 4(d)
-- Shows all countries with a population
-- greater than 35 million
SELECT name FROM Countries
WHERE population > 35000000;

-- 4(e)
-- Shows all countries bordering Germany
-- with a population greater than 35 million
SELECT country_a FROM Borders
	INNER JOIN Countries C
		ON C.name = country_a
		AND country_b = 'Germany'
		AND population >35000000;

