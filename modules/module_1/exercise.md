# Exercise: Create an ER Diagram Data Model and Implement It in MySQL

## Scenario
Little Lemon needs a robust relational database system in MySQL to store and manage business data. The database should maintain information about:

- Bookings
- Orders
- Order delivery status
- Menu
- Customer details
- Staff information

## Prerequisites
Use MySQL Workbench to create the ER diagram and implement it in your MySQL server.

## Task Instructions
Use MySQL Workbench to develop and implement the Little Lemon relational database. Save the project files in a folder named `db-capstone-project`.

### Task 1
Create a normalized ER diagram (1NF, 2NF, and 3NF) with relevant relationships that satisfy Little Lemon requirements.

Include these entities:

- `Bookings`: booking ID, date, and table number.
- `Orders`: order date, quantity, and total cost.
- `Order delivery status`: delivery date and status.
- `Menu`: cuisines, starters, courses, drinks, and desserts.
- `Customer details`: names and contact details.
- `Staff information`: role and salary.

Guidance:

- Identify entities and attributes.
- Identify primary and foreign keys.
- Define data types and constraints.

After modeling in MySQL Workbench Model Editor, save the data model as `LittleLemonDM` and export a PNG of the ER diagram.

### Task 2
Implement the Little Lemon data model in your MySQL server.

Guidance:

- Use MySQL Workbench forward engineering.
- Name the database `LittleLemonDB`.
- Export `LittleLemonDB` as a single SQL file in `db-capstone-project`.

### Task 3
List all databases in MySQL and confirm `LittleLemonDB` appears in the result.

Guidance:

- Write SQL in MySQL Workbench SQL Editor using `SHOW DATABASES;`.

## Conclusion
In this exercise, you created a Little Lemon ER data model, implemented it in MySQL, and verified the database in the server list.
