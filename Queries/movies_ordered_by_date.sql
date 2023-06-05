SELECT imdb_movies.names, genre.name, imdb_movies.id, imdb_movies.date_x, imdb_movies.revenue, imdb_movies.score
FROM imdb_movies
JOIN genre_id ON imdb_movies.id = genre_id.movie_id
JOIN genre ON genre_id.genres = genre.genre_id
ORDER BY SUBSTR(imdb_movies.date_x, 7, 4)
