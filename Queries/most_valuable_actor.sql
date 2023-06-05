SELECT c.name, m.budget_x
FROM imdb_movies m
JOIN crew_id ci ON m.id = ci.movie_id
JOIN crew c ON ci.crews = c.crew_id
ORDER BY m.budget_x DESC lIMIT 1;