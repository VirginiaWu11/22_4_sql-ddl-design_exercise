-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- original
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );



CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star TEXT NOT NULL
);


CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_star_id INT NOT NULL REFERENCES stars,
  galaxy_id INT NOT NULL REFERENCES galaxies
);



CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL,
  planet_id INT NOT NULL REFERENCES planets
);



-- original
-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');




INSERT INTO stars
  (star)
VALUES ('The Sun'),('Proxima Centauri'),('Gliese 876');



INSERT INTO galaxies
  (galaxy)
VALUES ('Milky Way');

INSERT INTO planets
  (planet, orbital_period_in_years, orbits_around_star_id , galaxy_id)
VALUES
  ('Earth', 1.00, 1,1),
  ('Mars', 1.88, 1,1),
  ('Venus', 0.62, 1,1),
  ('Neptune', 164.8, 1,1),
  ('Proxima Centauri b', 0.03, 2,1),
  ('Gliese 876 b', 0.23, 3,1);
  
INSERT INTO moons
  (moon,planet_id)
VALUES('The Moon',1), 
('Phobos',2),
('Deimos',2),
('Naiad',4),
('Thalassa',4),
('Despina',4),
('Galatea',4),
('Larissa',4),
('S/2004 N 1',4),
('Proteus',4),
('Triton',4),
('Nereid',4),
('Halimede',4),
('Sao',4),
('Laomedeia',4),
('Psamathe',4),
('Neso',4);