-- =========================================
-- DATABASE: universe
-- =========================================

-- Membuat tabel Galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_type TEXT,
    age_in_millions_of_years INT,
    distance_from_earth NUMERIC,
    is_spherical BOOLEAN
);

-- Insert data galaxy
INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, distance_from_earth, is_spherical)
VALUES
('Milky Way', 'Spiral', 13600, 0, true),
('Andromeda', 'Spiral', 10000, 2537000, true),
('Triangulum', 'Spiral', 12000, 3000000, true),
('Sombrero', 'Elliptical', 9000, 29000000, true),
('Whirlpool', 'Spiral', 400, 23000000, true),
('Pinwheel', 'Spiral', 21000, 21000000, true);

-- Membuat tabel Star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL,
    star_type TEXT,
    age_in_millions_of_years INT,
    is_spherical BOOLEAN,
    CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id)
        REFERENCES galaxy(galaxy_id)
);

-- Insert data star
INSERT INTO star (name, galaxy_id, star_type, age_in_millions_of_years, is_spherical)
VALUES
('Sun', 1, 'G-type', 4600, true),
('Proxima Centauri', 1, 'Red Dwarf', 4500, true),
('Sirius', 1, 'Binary', 242, true),
('Betelgeuse', 1, 'Red Supergiant', 10, true),
('Rigel', 1, 'Blue Supergiant', 8, true),
('Alpha Andromedae', 2, 'B-type', 60, true);

-- Membuat tabel Planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL,
    planet_type TEXT,
    has_life BOOLEAN,
    distance_from_earth NUMERIC,
    CONSTRAINT fk_star FOREIGN KEY (star_id)
        REFERENCES star(star_id)
);

-- Insert data planet
INSERT INTO planet (name, star_id, planet_type, has_life, distance_from_earth)
VALUES
('Mercury', 7, 'Terrestrial', false, 77),
('Venus', 7, 'Terrestrial', false, 261),
('Earth', 7, 'Terrestrial', true, 0),
('Mars', 7, 'Terrestrial', false, 225),
('Proxima b', 8, 'Exoplanet', false, 4.2),
('Proxima c', 8, 'Exoplanet', false, 4.2),
('Jupiter', 7, 'Gas Giant', false, 628),
('Saturn', 7, 'Gas Giant', false, 1275),
('Uranus', 8, 'Ice Giant', false, 2724),
('Neptune', 9, 'Ice Giant', false, 4351),
('Kepler-22b', 10, 'Exoplanet', false, 600),
('Kepler-452b', 10, 'Exoplanet', false, 1400);

-- Membuat tabel Moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT NOT NULL,
    is_spherical BOOLEAN,
    diameter_km INT,
    distance_from_planet INT,
    CONSTRAINT fk_planet FOREIGN KEY (planet_id)
        REFERENCES planet(planet_id)
);

-- Insert data moon
INSERT INTO moon (name, planet_id, is_spherical, diameter_km, distance_from_planet)
VALUES
('Moon', 15, true, 3474, 384400),
('Phobos', 16, false, 22, 9376),
('Deimos', 16, false, 12, 23463),
('Io', 19, true, 3643, 421700),
('Europa', 19, true, 3122, 670900),
('Ganymede', 19, true, 5268, 1070400),
('Callisto', 19, true, 4821, 1882700),
('Venus Moon 1', 14, true, 500, 200000),
('Venus Moon 2', 14, true, 300, 150000),
('Mercury Moon 1', 13, true, 100, 50000),
('Proxima b Moon 1', 17, true, 800, 120000),
('Proxima b Moon 2', 17, true, 600, 200000),
('Proxima c Moon 1', 18, true, 900, 300000),
('Proxima c Moon 2', 18, true, 700, 400000),
('Proxima c Moon 3', 18, true, 500, 250000),
('Proxima c Moon 4', 18, true, 450, 350000),
('Proxima c Moon 5', 18, true, 420, 150000),
('Proxima c Moon 6', 18, true, 390, 100000);

-- Membuat tabel Comet
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    is_periodic BOOLEAN
);

-- Insert data comet
INSERT INTO comet (name, is_periodic)
VALUES
('Halley', true),
('Hale-Bopp', false),
('Encke', true);
