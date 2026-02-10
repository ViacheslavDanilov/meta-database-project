Exercise: Create a virtual table to summarize data
Scenario
Little Lemon needs to retrieve data from their database. You can use your knowledge of MySQL to help them. As part of this task, you need to:

Create a virtual table to summarize data.

Use a JOIN statement to query data from multiple tables.

Create a SQL statement with a subquery.

You can carry out these steps using your knowledge of virtual tables, JOIN statements and SQL queries. Review the instructions that follow for guidance on completing these tasks.


Prerequisites
In the previous module, you developed a data model for Little Lemon and implemented it in your MySQL server. Your database should now contain several tables including the following:

Menus, 

Orders, 

MenuItems,

and Customers.

These tables might have a different name within your database. However, they should still contain similar data to, and resemble the relationships in, the following diagram:

![diagram](./image_1.png)

Ensure your schema includes Quantity and TotalCost in the Orders table and MenuItemsID in the Menus table. The MenuItems table contains item names and categories (starter, main, dessert, drink).

You also need to use MySQL Workbench SQL editor to write the required subquery, virtual table and JOIN statements.


Task instructions
Little Lemon need you to create some reports on the orders placed in the restaurant. Complete the following tasks to help Little Lemon obtain the relevant information about the menu’s orders.

Little Lemon uses an à-la-carte model. Customers may order any single item, including starter-only, dessert-only, or drinks-only items.

Task 1
In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 

Here’s some guidance around completing this task: 

Use a CREATE VIEW statement.

Extract the order id, quantity and cost data from the Orders table.

Filter data from the orders table based on orders with a quantity greater than 2. 

You can query the OrdersView table using the following syntax:

```sql
Select * from OrdersView;
```

The output result of your query (depending on the data populated in your database) should be similar to the example in the following screenshot. 

![output](./image_2.png)

Depending on your schema, this column may be named TotalCost. The screenshot uses Cost for simplicity.

Task 2
For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 

Customers table: The customer id and full name.

Orders table: The order id and cost.

Menus table: The menus name.

MenusItems table: the item’s name and category (e.g., starter, main, dessert, drink).

The result set should be sorted by the lowest cost amount.

The output result of your query (depends on the data populated in your database) should be similar to the example in the following screenshot: 

![output](./image_3.png)

Task 3
For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed using a subquery. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.

Here’s some guidance around completing this task: 

Use the ANY operator in a subquery

The outer query should be used to select the menu name from the menus table.

The inner query should check if any item quantity in the order table is more than 2. 

The output result of your query (depends on the data populated in your database) should be similar to the following screenshot:

![output](./image_4.png)

Conclusion
In this exercise you helped Little Lemon to create reports using your knowledge of virtual tables, JOIN statements and SQL queries.
