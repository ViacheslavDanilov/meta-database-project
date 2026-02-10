# Little Lemon ERD Guide

This guide summarizes the model used for Task 1 and matches `LittleLemonDB.sql`.

## Core Tables

- `Customers`
- `Staff`
- `Bookings`
- `Orders`
- `OrderItems`
- `OrderDeliveryStatus`
- `MenuCategories`
- `MenuItems`

## Relationship Summary

- `Customers` (1) → (N) `Bookings`
- `Customers` (1) → (N) `Orders`
- `Staff` (1) → (N) `Orders`
- `Bookings` (1) → (N) `Orders` (optional link from order)
- `Orders` (1) → (N) `OrderItems`
- `MenuItems` (1) → (N) `OrderItems`
- `MenuCategories` (1) → (N) `MenuItems`
- `Orders` (1) → (1) `OrderDeliveryStatus`

## Normalization (1NF, 2NF, 3NF)

- **1NF**: all columns contain atomic values only.
- **2NF**: order line details are separated into `OrderItems`.
- **3NF**: customer, staff, and menu category data are stored in independent tables.

## Requirement Mapping

- **Bookings**: booking ID, booking date/time, table number.
- **Orders**: order date, quantity, total cost.
- **Order delivery status**: delivery date and status.
- **Menu**: cuisines/starters/courses/drinks/desserts represented via categories and menu items.
- **Customer details**: first name, last name, phone, email.
- **Staff information**: first name, last name, role, salary.
