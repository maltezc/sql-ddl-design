CREATE TABLE stars (
  star_id SERIAL PRIMARY KEY,
  star_name TEXT UNIQUE,
  star_temp_k INT NOT NULL
  );


CREATE TABLE planets (
  planet_id SERIAL PRIMARY KEY, -- NOT NECESSARY(DEBATABLE)
  planet_name TEXT UNIQUE NOT NULL, -- SHOULD HAVE ADDED VARCAR LIMIT TO 30 CHARS USING VARCHAR -- SHOULD HAVE BEEN PRIMARY KEY
  orbital_period_in_years FLOAT NOT NULL, -- ADDED
  star_id INT REFERENCES stars NOT NULL,
  UNIQUE (planet_name, star_id)); -- NOT NECESSARY (DEBATABLE)


CREATE TABLE moons (
  moon_id SERIAL PRIMARY KEY, -- NOT NECESSARY
  moon_name TEXT UNIQUE NOT NULL, -- SHOULD HAVE BEEN PRIMARY KEY
  planet_id INT REFERENCES planets,
  UNIQUE (moon_name, planet_id)); -- NOT NECESSARY (DEBATABLE)
-- if moon_name is the PRIMARY KEY, THEN REFERENCING ITEM MUST BE A TEXT VALUE


-- stars insert value
INSERT INTO stars(star_name, star_temp_k)
VALUES
  ('The Sun', 2343), -- example for kelvin entry
  ('Proxima Centauri'),
  ('Gliese 876');

-- planets insert
INSERT INTO planets(planet_name, star_id, orbital_period_in_years)
VALUES
  ('Earth', 1, 1.23), -- example oribital_period_in_years entry
  ('Mars', 1),
  ('Venus', 1);
  ('Proxima Centauri b', 2);
  ('Gliese 876 b', 3);

INSERT INTO moons(moon_name, planet_id)
VALUES
  ('The moon', 1),
  ('Phobos', 2),
  ('Deimos', 2);


-- Query STATEMENT FOR TABLE
SELECT planet_name, stars.star_name, COUNT(moon_id) AS moon_count
  FROM planets
  OUTER LEFT JOIN stars
    ON planets.star_id = stars.star_id
  OUTER LEFT JOIN moons
    ON moons.planet_id = planets.planet_id
      GROUP BY planet_name, stars.star_name
      ORDER BY planet_name;

