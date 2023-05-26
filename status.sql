CREATE TABLE Status (
  status_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);
INSERT INTO Status (name)
SELECT status
FROM imdb_movies_with_id;