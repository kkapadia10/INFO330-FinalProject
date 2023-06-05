import sqlite3
import matplotlib.pyplot as plt
import matplotlib.cm as cm
from mpl_toolkits import mplot3d
import numpy as np
# create a connector to the database
conn = sqlite3.connect("IMDB_movies.sqlite3")
# create a cursor
cursor = conn.cursor()
# get budget table and revenue table from database
budget_and_revenue = cursor.execute('select revenue, budget_x , score from imdb_movies order by revenue;')
# create a list to store the budget and revenue
budget = []
revenue = []
score = []
# get the budget and revenue from the table
for row in budget_and_revenue:
    (budget.append(float(row[1])))
    revenue.append(float(row[0]))
    score.append(float(row[2]))

# create a line graph that shows the relationship between budget and revenue
x = budget
y = revenue
z = score

fig = plt.figure()
 
# Defining the axes as a
# 3D axes so that we can plot 3D
# data into it.
ax = plt.axes(projection="3d")
# plotting a 3D line graph with X-coordinate,
# Showing the above plot
ax.scatter3D(x, y, z, c=z, cmap='cividis');
plt.xlabel('budget')
plt.ylabel('revenue')
ax.set_zlabel('score')
plt.title('budget vs revenue vs score') 
plt.show()
 
# Showing the above plot
#plt.show()
#plt.xlabel('budget')
#plt.ylabel('revenue')
#plt.title('budget vs revenue')
#plt.show()

conn.commit()
conn.close()