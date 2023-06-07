SELECT imdb_movies.names, imdb_movies.score
  FROM imdb_movies
  JOIN Language ON imdb_movies.Language_id = Language.lang_id
  WHERE Language.lang_id = 30
  ORDER BY imdb_movies.score DESC; 