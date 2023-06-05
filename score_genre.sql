SELECT ROW_NUMBER() OVER (ORDER BY m.score DESC) 
AS row_number, m.names, m.score, g.name AS genre 
FROM imdb_movies m 
JOIN genre_id gi ON m.id = gi.movie_id 
JOIN genre g ON gi.genres = g.genre_id 
ORDER BY m.score DESC
LIMIT 100;
