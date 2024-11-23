--done--
CREATE TABLE optics.provider(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
address_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
phone VARCHAR(20) NOT NULL,
fax VARCHAR(20) NOT NULL,
nif VARCHAR(20) NOT NULL UNIQUE,

CONSTRAINT FK_Address FOREIGN KEY (address_id) REFERENCES address(id)
);

--done--
CREATE TABLE optics.address(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
street VARCHAR(60) NOT NULL,
street_number VARCHAR(10) NOT NULL,
floor INT NOT NULL,
door_number VARCHAR(10) NOT NULL,
city VARCHAR(60) NOT NULL,
zip_code VARCHAR(20) NOT NULL,
country VARCHAR(60) NOT NULL
);

CREATE TABLE optics.trademark(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
provider_id INT NOT NULL,
name VARCHAR(100) NOT NULL,

CONSTRAINT FK_Provider_trademark FOREIGN KEY (provider_id) REFERENCES provider(id)
);


CREATE TABLE optics.glasses(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
trademark_id INT NOT NULL,
left_glass_graduation DOUBLE NOT NULL,
right_glass_graduation DOUBLE NOT NULL,
frame_type ENUM ('Floating', 'Paste', 'Metal') NOT NULL,
frame_color VARCHAR(20) NOT NULL,
left_glass_color VARCHAR(20) NOT NULL,
right_glass_color VARCHAR(20) NOT NULL,
price DOUBLE NOT NULL,

CONSTRAINT FK_Trademark FOREIGN KEY(trademark_id) REFERENCES trademark(id)
);

CREATE TABLE optics.employee(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
name VARCHAR(60) NOT NULL,
last_name VARCHAR(60) NOT NULL,
phone_number VARCHAR(60) NOT NULL,
nie VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE optics.client(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
adviser_client_id INT,
registered_at TIMESTAMP NOT NULL,
name VARCHAR(60) NOT NULL,
zip_code VARCHAR(20) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,

CONSTRAINT FK_Client FOREIGN KEY (adviser_client_id) REFERENCES client(id)
);


CREATE TABLE sales(
glasses_id INT NOT NULL,
client_id INT NOT NULL,
employee_id INT NOT NULL,
sold_at TIMESTAMP NOT NULL,

CONSTRAINT FK_glasses_sales FOREIGN KEY (glasses_id) REFERENCES glasses(id),
CONSTRAINT FK_client_sales FOREIGN KEY (client_id) REFERENCES client(id),
CONSTRAINT FK_employee_sales FOREIGN KEY (employee_id) REFERENCES employee(id)
);