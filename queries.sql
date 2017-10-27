--A1.
-- Sum of passengers that departed CO
SELECT SUM(passengers) AS total_passengers
FROM flights
INNER JOIN airport
ON flights.origin_airport_id = airport.airport_id

INNER JOIN location
ON airport.city_abr = location.city_abr

INNER JOIN state_abr
ON location.state_abr = state_abr.state_abr

WHERE state_abr.state_abr = 'CO';

--complete city name, state name, airport code, 
--complete airline name, number of passengers

SELECT location.city_name, state_abr.state_name,
airport.city_abr AS airport_code, carrier.carrier_name AS airline_name, flights.passengers
FROM flights
INNER JOIN airport
ON flights.origin_airport_id = airport.airport_id

INNER JOIN carrier
ON flights.unique_carrier_entity = carrier.unique_carrier_entity

INNER JOIN location
ON airport.city_abr = location.city_abr

INNER JOIN state_abr
ON location.state_abr = state_abr.state_abr

WHERE state_abr.state_abr = 'CO';


--A2.
--Sum of freight that departed CO
SELECT SUM(freight) AS total_freight
FROM flights
INNER JOIN airport
ON flights.origin_airport_id = airport.airport_id

INNER JOIN location
ON airport.city_abr = location.city_abr

INNER JOIN state_abr
ON location.state_abr = state_abr.state_abr

WHERE state_abr.state_abr = 'CO';

--complete city name, state name, airport code, 
--complete airline name, freight

SELECT location.city_name, state_abr.state_name,
airport.city_abr, carrier.carrier_name, flights.freight
FROM flights
INNER JOIN airport
ON flights.origin_airport_id = airport.airport_id

INNER JOIN carrier
ON flights.unique_carrier_entity = carrier.unique_carrier_entity

INNER JOIN location
ON airport.city_abr = location.city_abr

INNER JOIN state_abr
ON location.state_abr = state_abr.state_abr

WHERE state_abr.state_abr = 'CO';

--A3. 
--How many passengers arrived from outside CO 
SELECT SUM(passengers)
FROM flights f,
location origin, airport o
WHERE f.origin_airport_id = o.airport_id
AND o.city_abr = origin.city_abr
AND origin.state_abr != 'CO';

--origin city name & state, destination city in CO, airline name
SELECT origin.city_name AS origin_city, origin.state_abr AS origin_state,
dest.city_name AS dest_city, carrier.carrier_name, f.passengers
FROM flights f, 
location origin, location dest, 
airport o, airport d,
carrier
WHERE f.origin_airport_id = o.airport_id
AND f.dest_airport_id = d.airport_id
AND o.city_abr = origin.city_abr
AND d.city_abr = dest.city_abr
AND carrier.unique_carrier_entity = f.unique_carrier_entity
AND origin.state_abr != 'CO';


--A4.
--flights into Denver between 500-1200 miles
--origin city and state, airline name
SELECT location.city_name AS origin_city, location.state_abr AS origin_state,
carrier.carrier_name AS airline_name, distance.distance 

FROM flights
INNER JOIN airport
ON flights.dest_airport_id = airport.airport_id

INNER JOIN distance
ON flights.origin_airport_id = distance.origin_airport_id
AND flights.dest_airport_id = distance.dest_airport_id

INNER JOIN carrier
ON flights.unique_carrier_entity = carrier.unique_carrier_entity

INNER JOIN location
ON airport.city_abr = location.city_abr

WHERE distance.distance > 500
AND distance.distance < 1200
AND location.state_abr = 'CO'
ORDER BY distance DESC;
