CREATE TABLE country (
  country_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);
INSERT INTO country (name)
SELECT DISTINCT country
FROM imdb_movies_with_id;

-- update the main table --
UPDATE imdb_movies_with_id
SET country = country.country_id
FROM country
WHERE imdb_movies_with_id.country = country.name;