CREATE TABLE Country (
  country_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);
INSERT INTO Country (name)
SELECT country
FROM imdb_movies_with_id;
