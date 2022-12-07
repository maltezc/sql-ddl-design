CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  flights_id INT NOT NULL REFERENCES flights,
  seat VARCHAR(3) NOT NULL,
  UNIQUE(first_name,last_name,seat,flights_id),(seat,flights_id)
  );

CREATE TABLE flights(
  id SERIAL PRIMARY KEY
  airline_id INT NOT NULL REFERENCES airlines,
  departure_time TIMESTAMP WITH TIMEZONE NOT NULL,
  departure_city INT NOT NULL REFERENCES cities,
  arrival_time TIMESTAMP NOT NULL,
  destination_city INT NOT NULL REFERENCES cities
)

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  city_name VARCHAR(30) NOT NULL UNIQUE,
  country_code INT NOT NULL
);

CREATE table countries(
  id SERIAL PRIMARY Key,
  country_name VARCHAR(30) NOT NULL UNIQUE
);




-- OG code.
/* CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  seat TEXT,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  airline TEXT,
  from_city TEXT,
  from_country TEXT,
  to_city TEXT,
  to_country TEXT); */

INSERT INTO tickets(first_name, last_name, seat,airline
                    departure_time, arrival_time,
                    departure_id, destination_id)
  VALUES
  ('Jennifer', 'Finch', '33B',
   '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United',
   'Washington DC', 'United States',
   'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A',
   '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways',
   'Tokyo', 'Japan',
   'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F',
   '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta',
   'Los Angeles', 'United States',
   'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A',
   '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta',
   'Seattle', 'United States',
   'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D',
   '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium',
   'Paris', 'France',
   'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C',
   '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China',
   'Dubai', 'UAE',
   'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E',
   '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United',
   'New York', 'United States',
   'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A',
   '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines',
   'Cedar Rapids', 'United States',
   'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B',
   '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines',
   'Charlotte', 'United States',
   'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D',
   '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil',
   'Sao Paolo', 'Brazil',
   'Santiago', 'Chile'),
  ('Hamish', 'O''Reilly', '8B',
   '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways',
   'Tokyo', 'Japan',
   'London', 'United Kingdom'),
  ('Eileen', 'O''Reilly', '8A',
   '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways',
   'Tokyo', 'Japan',
   'London', 'United Kingdom');
