--done--
CREATE TABLE pizzeria.client(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
name VARCHAR(60) NOT NULL,
last_name VARCHAR(60) NOT NULL,
address VARCHAR(100) NOT NULL,
zip_code VARCHAR(60) NOT NULL,
location_id INT NOT NULL,
phone_number VARCHAR(60) NOT NULL,
CONSTRAINT FK_Location_client FOREIGN KEY (location_id) REFERENCES location(id)
);

--done--
CREATE TABLE pizzeria.location(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
province_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
CONSTRAINT FK_Province_location FOREIGN KEY (province_id) REFERENCES province(id),
CONSTRAINT unique_location_per_province UNIQUE (province_id, name)
);

--done--
CREATE TABLE pizzeria.province(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
name VARCHAR(100) NOT NULL
);

--done--
CREATE TABLE pizzeria.orders (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
store_id INT NOT NULL,
client_id INT NOT NULL,
ordered_at TIMESTAMP NOT NULL,
delivery_type_id INT NOT NULL,
CONSTRAINT FK_Client_orders FOREIGN KEY (client_id) REFERENCES client(id),
CONSTRAINT FK_Store_orders FOREIGN KEY (store_id) REFERENCES store(id),
CONSTRAINT FK_Delivery_type_orders FOREIGN KEY (delivery_type_id) REFERENCES delivery_type(id)
);

--done--
CREATE TABLE pizzeria.order_details (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
product_quantity INT NOT NULL DEFAULT 1,
product_price DECIMAL(10, 2) NOT NULL,
CONSTRAINT FK_Order_OrderDetails FOREIGN KEY (order_id) REFERENCES orders(id),
CONSTRAINT FK_Product_OrderDetails FOREIGN KEY (product_id) REFERENCES product(id)
);

--done--
CREATE TABLE pizzeria.delivery_type(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
name VARCHAR(60) NOT NULL
);

--done--
CREATE TABLE pizzeria.home_delivery(
delivery_type_id INT NOT NULL,
employee_id INT NOT NULL,
delivery_time TIMESTAMP NOT NULL,
CONSTRAINT FK_Delivery_type_home_delivery FOREIGN KEY (delivery_type_id) REFERENCES delivery_type(id),
CONSTRAINT FK_Employee_home_delivery FOREIGN KEY (employee_id) REFERENCES employee(id)
);

--done--
CREATE TABLE pizzeria.product(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
product_type_id INT NOT NULL,
pizza_category_id INT,
name VARCHAR(60) NOT NULL,
description VARCHAR(100) NOT NULL,
image_id INT NOT NULL,
price DOUBLE NOT NULL,
CONSTRAINT FK_Product_type FOREIGN KEY (product_type_id) REFERENCES product_type(id),
CONSTRAINT FK_pizza_category FOREIGN KEY (pizza_category_id) REFERENCES pizza_category(id),
CONSTRAINT FK_Image FOREIGN KEY (image_id) REFERENCES image(id)
);

--done--
CREATE TABLE pizzeria.image(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
image_path VARCHAR(100) NOT NULL
);

--done--
CREATE TABLE pizzeria.product_type(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
name VARCHAR(60) NOT NULL
);

--done--
CREATE TABLE pizzeria.pizza_category(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY  UNIQUE,
name VARCHAR(60) NOT NULL
);

--done--
CREATE TABLE pizzeria.store(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
address VARCHAR(100) NOT NULL,
zip_code VARCHAR(60) NOT NULL,
location_id INT NOT NULL,
CONSTRAINT FK_Location_store FOREIGN KEY (location_id) REFERENCES location(id),
);

--done--
CREATE TABLE pizzeria.employee(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
store_id INT NOT NULL,
name VARCHAR(60) NOT NULL,
last_name VARCHAR(60) NOT NULL,
nif VARCHAR(60) NOT NULL UNIQUE,
phone_number VARCHAR(60) NOT NULL,
job_type ENUM ('cuiner/a', 'repartidor/a') NOT NULL,
CONSTRAINT FK_Store_employee FOREIGN KEY (store_id) REFERENCES store(id)
);