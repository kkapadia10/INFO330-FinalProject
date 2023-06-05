import sqlite3
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import numpy as np
# create a connector to the database
conn = sqlite3.connect("IMDB_movies.sqlite3")
# create a cursor
cursor = conn.cursor()
# get budget table and score table from database
budget_and_score = cursor.execute('select score, budget_x from imdb_movies order by score;')
# create a list to store the budget and score
budget = []
score = []
# get the budget and score from the table
for row in budget_and_score:
    (budget.append(float(row[1])))
    score.append(float(row[0]))
# create a line graph that shows the relationship between budget and score
plt.scatter(budget,score,alpha=0.7,cmap=cm.Paired)
plt.xlabel('budget')
plt.ylabel('score')
plt.title('budget vs score')
plt.show()

conn.commit()
conn.close()