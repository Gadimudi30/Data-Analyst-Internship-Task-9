# Data-Analyst-Internship-Task-9

# Task 9 – SQL Star Schema Data Modeling

## About the Task
In this task, I worked on SQL data modeling by creating a **Star Schema** using a retail sales dataset.  
The main aim was to understand how sales data is organized for reporting and analysis.

---

## Dataset
I used the **Retail Sales Dataset**, which contains transaction details such as customer information, product category, quantity, price, and total sales amount.

---

## What I Did
- Identified the **fact table** and **dimension tables**
- Created dimension tables for customer, product, and date
- Created a sales fact table and linked it with dimensions using keys
- Inserted data into all tables
- Added indexes to improve query performance
- Ran basic analysis queries on the star schema
- Created a star schema diagram

---

## Star Schema Diagram
The star schema diagram was created using **dbdiagram.io** and shows:
- One central fact table (sales)
- Multiple dimension tables connected to it

File included:  
`star_schema_diagram.png`

---

## Files Included
- `task9_star_schema.sql`
- `star_schema_diagram.png`
- `analysis_outputs.csv`
- `retail_sales_dataset.csv`

---

## Learning Outcome
This task helped me understand:
- The difference between fact and dimension tables
- Why star schema is used in data warehousing
- How SQL is used for analytical reporting
