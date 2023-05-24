CREATE TABLE IF NOT EXISTS  imdb_movies_with_id ( 
id INTEGER PRIMARY KEY AUTOINCREMENT,
names TEXT,
date_x TEXT,
score TEXT,
genre TEXT,
overview TEXT,
crew TEXT,
original_title TEXT,
status TEXT,
original_language TEXT,
budget_x TEXT,
revenue TEXT,
country TEXT);

INSERT INTO imdb_movies_with_id (names, date_x, score, genre, overview, crew, original_title, status, original_language, budget_x, revenue, country)
SELECT * FROM imdb_movies_import;
