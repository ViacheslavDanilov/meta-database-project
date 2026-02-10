# Exercise 4: Add Query Functions

## Scenario
Little Lemon has started building a booking system to manage customer data. A key requirement is search functionality so they can query data efficiently. In this exercise, you will implement Python-based database queries.

## Prerequisites
Before starting, ensure you have:

- A working Python environment.
- MySQL Connector/Python configured.
- Access to the Little Lemon database with customer and order data.
- A valid database user with read permissions.

## Task Instructions
Complete the following tasks to add query functionality to the client project.

## Task 1
Extend your Python environment to connect to the database and create a cursor.

Guidance:

- Import MySQL connector (you may use an alias).
- Connect with username, password, and database name.
- Create a cursor from the connection object.

Example:

```python
import mysql.connector as connector

connection = connector.connect(
    user="your_username",
    password="your_password",
    database="database_name"
)

cursor = connection.cursor()
```

## Task 2
Query the database to show all tables.

Guidance:

- Create a query string for `SHOW TABLES`.
- Execute it with `cursor.execute(...)`.
- Fetch all results and print them.

Example:

```python
show_tables_query = "SHOW TABLES"
cursor.execute(show_tables_query)
results = cursor.fetchall()
print(results)
```

## Task 3
Create and execute a `JOIN` query to return full name and contact details for customers with orders greater than `$60`.

Guidance:

- Identify required fields from `Customers` and `Orders`.
- Join both tables using the common customer key.
- Filter with `WHERE` on `TotalCost > 60`.
- Execute via cursor and inspect results.

Example query (adapt column names to your schema):

```sql
SELECT
    c.FirstName,
    c.LastName,
    c.Phone,
    c.Email,
    o.TotalCost
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalCost > 60;
```

Python execution pattern:

```python
join_query = """
SELECT
    c.FirstName,
    c.LastName,
    c.Phone,
    c.Email,
    o.TotalCost
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalCost > 60;
"""

cursor.execute(join_query)
rows = cursor.fetchall()
for row in rows:
    print(row)
```

## Conclusion
In this exercise, you practiced connecting Python to MySQL and running practical queries, including table inspection and `JOIN`-based filtering for business use cases.
