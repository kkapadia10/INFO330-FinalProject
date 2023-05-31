CREATE TABLE  status (
  status_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);
INSERT INTO status (name)
SELECT DISTINCT status
FROM imdb_movies_with_id;

-- update the main table --
UPDATE imdb_movies_with_id
SET status = status.status_id
FROM status
WHERE imdb_movies_with_id.status = status.name;