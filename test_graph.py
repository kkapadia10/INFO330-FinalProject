import sqlite3
import matplotlib.pyplot as plt
# create a connector to the database
conn = sqlite3.connect("IMDB_movies.sqlite3")
# create a cursor
cursor = conn.cursor()
# get budget table and revenue table from database
budget_and_revenue = cursor.execute('select revenue, budget_x from imdb_movies order by revenue limit 10;')
# create a list to store the budget and revenue
budget = []
revenue = []
# get the budget and revenue from the table
for row in budget_and_revenue:
    budget.append(row[1])
    revenue.append(row[0])
# create a graph that shows the relationship between budget and revenue
plt.scatter(budget, revenue)
plt.xlabel('budget')
plt.ylabel('revenue')
plt.title('budget vs revenue')
plt.show()

conn.commit()
conn.close()