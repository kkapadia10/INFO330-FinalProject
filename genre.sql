CREATE TABLE genre_temp AS
WITH split(pokedex_number, abilities , nextAbility) AS (
    SELECT pokedex_number, '' AS abilities, abilities|| ',' AS nextAbility
    FROM pokemon_import
    UNION ALL
        SELECT pokedex_number,
        substr(nextAbility, 0, instr(nextAbility, ',')) AS abilities,
        substr(nextAbility, instr(nextAbility, ',')+1) AS nextAbility
    FROM split
    WHERE nextAbility !=''
)
SELECT pokedex_number, abilities
FROM split
WHERE abilities != ''
ORDER BY pokedex_number;

-- rename abilities and pokedex_number --
ALTER TABLE genre_temp
RENAME COLUMN abilities TO moves;

ALTER TABLE genre_temp
RENAME COLUMN pokedex_number TO dex;
