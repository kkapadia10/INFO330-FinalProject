CREATE TABLE  Language (
  lang_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);
INSERT INTO Language (name)
SELECT DISTINCT original_language
FROM imdb_movies_with_id;

-- update the main table --
UPDATE imdb_movies_with_id
SET original_language = Language.lang_id
FROM Language
WHERE imdb_movies_with_id.original_language = Language.name;