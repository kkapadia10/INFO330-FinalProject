import sqlite3
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import numpy as np
# create a connector to the database
conn = sqlite3.connect("IMDB_movies.sqlite3")
# create a cursor
cursor = conn.cursor()
# get budget table and revenue table from database
budget_and_revenue = cursor.execute('select revenue, budget_x from imdb_movies order by revenue;')
# create a list to store the budget and revenue
budget = []
revenue = []
# get the budget and revenue from the table
for row in budget_and_revenue:
    (budget.append(float(row[1])))
    revenue.append(float(row[0]))
# create a line graph that shows the relationship between budget and revenue
plt.scatter(budget,revenue,alpha=0.7,cmap=cm.Paired)
plt.xlabel('budget')
plt.ylabel('revenue')
plt.title('budget vs revenue')
plt.show()

conn.commit()
conn.close()