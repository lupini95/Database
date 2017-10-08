CREATE DATABASE airtraffic;

\c airtraffic;

CREATE TABLE month_to_quarter(
	month INT PRIMARY KEY NOT NULL,
	quarter INT);

CREATE TABLE state_abr(
	state_abr CHAR(2),
	state_name VARCHAR(20),
	state_fips INT,
	PRIMARY KEY (state_abr));

CREATE TABLE aircraft(
	aircraft_group INT,
	aircraft_type INT,
	aircraft_config INT,
	seats INT,
	payload INT,
	flight_id INT,
	PRIMARY KEY (flight_id));

CREATE TABLE airport(
	airport_id INT,
	airport_seq_id INT,
	city_abr CHAR(3),
	PRIMARY KEY (airport_id));

CREATE TABLE carrier(
	unique_carrier VARCHAR(5),
	airline_id INT,
	unique_carrier_name VARCHAR(80),
	unique_carrier_entity VARCHAR(10),
	carrier VARCHAR(5), 
	region_abr CHAR(1),
	carrier_name VARCHAR(80),
	carrier_group INT,
	carrier_group_new INT,
	PRIMARY KEY (unique_carrier_entity));

CREATE TABLE carrier_date(
	carrier VARCHAR(5),
	region VARCHAR(26),
	state_date_source VARCHAR(10),
	CONSTRAINT PK_carrierexp PRIMARY KEY (carrier, region));

CREATE TABLE distance(
	origin_airport_id INT,
	dest_airport_id INT,
	distance INT,
	distance_group INT,
	CONSTRAINT PK_path PRIMARY KEY (origin_airport_id, dest_airport_id));

CREATE TABLE flights(
	year INT,
	month INT,
	class VARCHAR(2),
	passengers INT,
	freight INT,
	mail INT,
	ramp_to_ramp INT,
	air_time INT,
	origin_airport_id INT,
	dest_airport_id INT,
	flight_id INT,
	unique_carrier_entity VARCHAR(15),
	departures_scheduled INT,
	departures_performed INT,
	PRIMARY KEY (flight_id));

CREATE TABLE location(
	city_name VARCHAR(50),
	city_abr VARCHAR(5),
	state_abr VARCHAR(5),
	wac INT,
	city_market_id INT,
	PRIMARY KEY (city_abr));

