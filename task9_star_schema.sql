
Task 9: Star Schema for Retail Sales Dataset


Dimension Tables:-


CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE dim_product (
    product_key SERIAL PRIMARY KEY,
    product_category VARCHAR(50),
    price_per_unit NUMERIC
);

CREATE TABLE dim_date (
    date_key SERIAL PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);


Fact Table :-


CREATE TABLE fact_sales (
    sales_key SERIAL PRIMARY KEY,
    customer_key INT REFERENCES dim_customer(customer_key),
    product_key INT REFERENCES dim_product(product_key),
    date_key INT REFERENCES dim_date(date_key),
    quantity INT,
    total_amount NUMERIC
);


Indexes:-


CREATE INDEX idx_fact_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_product ON fact_sales(product_key);
CREATE INDEX idx_fact_date ON fact_sales(date_key);


Populate Dimensions:-


INSERT INTO dim_customer (customer_id, gender, age)
SELECT DISTINCT "Customer ID", Gender, Age FROM retail_sales;

INSERT INTO dim_product (product_category, price_per_unit)
SELECT DISTINCT "Product Category", "Price per Unit" FROM retail_sales;

INSERT INTO dim_date (full_date, year, month, day)
SELECT DISTINCT Date,
EXTRACT(YEAR FROM Date),
EXTRACT(MONTH FROM Date),
EXTRACT(DAY FROM Date)
FROM retail_sales;


Populate Fact Table:-


INSERT INTO fact_sales (customer_key, product_key, date_key, quantity, total_amount)
SELECT
c.customer_key,
p.product_key,
d.date_key,
r.Quantity,
r."Total Amount"
FROM retail_sales r
JOIN dim_customer c ON r."Customer ID" = c.customer_id
JOIN dim_product p ON r."Product Category" = p.product_category
JOIN dim_date d ON r.Date = d.full_date;
