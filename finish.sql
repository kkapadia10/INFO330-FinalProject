ALTER TABLE imdb_movies_with_id RENAME COLUMN country to country_id;
ALTER TABLE imdb_movies_with_id RENAME COLUMN status to status_id;
ALTER TABLE imdb_movies_with_id RENAME COLUMN original_language to language_id;
ALTER TABLE imdb_movies_with_id DROP COLUMN genre;
ALTER TABLE imdb_movies_with_id DROP COLUMN crew;

ALTER TABLE imdb_movies_with_id RENAME imdb_movies;