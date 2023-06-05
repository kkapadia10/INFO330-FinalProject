SELECT m.names
FROM imdb_movies m
JOIN crew_id ci ON m.id = ci.movie_id
JOIN crew c ON ci.crews = c.crew_id
WHERE c.name = 'Chris Pratt';
