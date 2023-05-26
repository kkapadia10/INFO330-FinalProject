CREATE TABLE  Language (
  lang_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);
INSERT INTO Language (name)
SELECT original_language
FROM imdb_movies_with_id;
