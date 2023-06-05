SELECT m.names
FROM imdb_movies m
JOIN genre_id gi ON m.id = gi.movie_id
JOIN genre g ON gi.genres = g.genre_id
WHERE g.name = "Action";
