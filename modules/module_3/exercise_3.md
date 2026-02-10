# Exercise 3: Set Up the Client Project

## Overview
At this point, you are familiar with the tools required to build a booking system for Little Lemon. You have refreshed Python, Jupyter Notebook, MySQL Connector/Python, and version control fundamentals. In this exercise, you will set up the working environment.

## Scenario
Little Lemon needs you to help build a booking system so guests can reserve tables. Use your knowledge of database clients to set up the project environment.

## Prerequisites
Before starting, ensure you have:

- A project folder created locally.
- A terminal opened in that folder.
- Python installed.
- A working IDE.
- A configured MySQL driver for database interaction.

## Task Instructions
Complete the following tasks to set up the client project.

## Task 1
Verify Python is installed and available on the command path.

Run:

```bash
python --version
```

Expected result:

- Python version is displayed.
- Python 3 should be installed.

If Python is missing or outdated, install/update using:

- `https://www.python.org/downloads/`

## Task 2
Install Jupyter and create a new notebook.

Run:

```bash
python -m pip install jupyter
```

Then start Jupyter:

```bash
jupyter notebook
```

In Jupyter:

- Click `New`.
- Select `ipykernel` to create a notebook.

## Task 3
Establish a Python connection to your database.

### Step 1
Install MySQL Connector/Python:

```bash
pip install mysql-connector-python
```

### Step 2
Import connector in Python:

```python
import mysql.connector as connector
```

### Step 3
Create a connection:

```python
connection = connector.connect(
    user="your_user_name",
    password="your_password_for_database"
)
```

## Conclusion
In this exercise, you configured a working client environment for Little Lemon's booking system, including Python, Jupyter, and database connectivity.
