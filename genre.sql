-- Use recursion to createa table --
CREATE TABLE genre_id AS
WITH split(id, genre , nextgenre) AS (
    SELECT id, '' AS genre, genre|| ',' AS nextgenre
    FROM imdb_movies_with_id
    UNION ALL
        SELECT id,
        substr(nextgenre, 0, instr(nextgenre, ',')) AS genre,
        substr(nextgenre, instr(nextgenre, ',')+1) AS nextgenre
    FROM split
    WHERE nextgenre !=''
)
SELECT id, genre
FROM split
WHERE genre != ''
ORDER BY id;

-- rename genre and id --
ALTER TABLE genre_id
RENAME COLUMN genre TO genres;

ALTER TABLE genre_id
RENAME COLUMN id TO movie_id;

-- create genre table --
CREATE TABLE genre AS
SELECT DISTINCT genres
FROM genre_id;

-- add autoincrementing id to genre table --
ALTER TABLE genre RENAME to genre_old;

CREATE TABLE genre (
genre_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

INSERT INTO genre (name) SELECT genres FROM genre_old;

DROP TABLE genre_old;


-- update genre_id table --
UPDATE genre_id
SET genres = genre.genre_id
FROM genre
WHERE genre_id.genres = genre.name;