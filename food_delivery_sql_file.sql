create database food_delivery;
use food_delivery;


-- customer table
create table dim_customer (
customer_id int primary key,
customer_age int,
customer_gender varchar(20),
customer_area varchar(100));

-- restaurant table
create table dim_restaurant (
restaurant_id int primary key,
restaurant_name VARCHAR(150),
    restaurant_area VARCHAR(100),
    restaurant_cuisine VARCHAR(100),
    restaurant_rating DECIMAL(3,1)
);

-- item table
CREATE TABLE dim_item (
    item_id INT PRIMARY KEY,
    restaurant_id INT not null,
    item_name VARCHAR(150),
    category VARCHAR(100)
    );
    
-- date table
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    day INT,
    day_name VARCHAR(20),
    quarter INT
);

-- orders table 
CREATE TABLE dim_orders (
    order_id VARCHAR(30) PRIMARY KEY,
    date_id INT,
    customer_id INT,
    restaurant_id INT,
    order_ts DATETIME,
    discount DECIMAL(10,2),
    delivery_fee DECIMAL(10,2),
    packaging_fee DECIMAL(10,2),
    gst DECIMAL(10,2),
    tip DECIMAL(10,2),
    final_amount DECIMAL(10,2),
    estimated_delivery_min INT,
    actual_delivery_min DECIMAL(10,2),
    order_status VARCHAR(50),
    payment_method VARCHAR(50),
    food_rating DECIMAL(3,1),
    delivery_rating DECIMAL(3,1),
    foreign key (date_id) references dim_date(date_id),
    foreign key (customer_id) references dim_customer(customer_id),
    foreign key (restaurant_id) references dim_restaurant(restaurant_id));
    
    -- fact table
    CREATE TABLE fact_order_items (
    order_item_id VARCHAR(30) PRIMARY KEY,
    order_id VARCHAR(30),
    item_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    line_subtotal DECIMAL(12,2),
    foreign key (order_id) references dim_orders(order_id),
    foreign key (item_id) references dim_item(item_id));

SELECT COUNT(*) FROM dim_orders;

