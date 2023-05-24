-- Use recursion to createa table --
CREATE TABLE crew_id AS
WITH split(id, crew , nextcrew) AS (
    SELECT id, '' AS crew, crew|| ',' AS nextcrew
    FROM imdb_movies_with_id
    UNION ALL
        SELECT id,
        substr(nextcrew, 0, instr(nextcrew, ',')) AS crew,
        substr(nextcrew, instr(nextcrew, ',')+1) AS nextcrew
    FROM split
    WHERE nextcrew !=''
)
SELECT id, crew
FROM split
WHERE crew != ''
ORDER BY id;

-- rename crew and id --
ALTER TABLE crew_id
RENAME COLUMN crew TO crews;

ALTER TABLE crew_id
RENAME COLUMN id TO movie_id;

-- create crew table --
CREATE TABLE crew AS
SELECT DISTINCT crews
FROM crew_id;

-- add autoincrementing id to crew table --
ALTER TABLE crew RENAME to crew_old;

CREATE TABLE crew (
crew_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

INSERT INTO crew (name) SELECT crews FROM crew_old;

DROP TABLE crew_old;


-- update crew_id table --
UPDATE crew_id
SET crews = crew.crew_id
FROM crew
WHERE crew_id.crews = crew.name;