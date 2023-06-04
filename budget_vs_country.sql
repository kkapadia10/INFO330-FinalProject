SELECT ROW_NUMBER() OVER (ORDER BY m.budget_x DESC, c.name) 
AS row_number, m.names, m.budget_x, c.name AS country
FROM imdb_movies m
JOIN country c ON m.country_id = c.country_id
ORDER BY m.budget_x DESC, c.name
LIMIT 100;
