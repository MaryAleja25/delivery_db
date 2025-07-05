use delivery_db;

CREATE TABLE user(
id INT primary KEY auto_increment,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20),
adress VARCHAR(255) NOT NULL
);

CREATE TABLE restaurant (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
adress VARCHAR(255) NOT NULL UNIQUE,
phone VARCHAR(20) NOT NULL
);

DROP TABLE restaurant;

CREATE TABLE products(
id INT PRIMARY KEY AUTO_INCREMENT,
restaurant_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT,
price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE `order`(
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
restaurant_id INT NOT NULL,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
estado VARCHAR(50) DEFAULT 'Pendiente', -- Ej: Pendiente, En camino, Entregado, Cancelafo
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

DROP TABLE pedidos;
DROP TABLE Delivery;

CREATE TABLE  order_details (
id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantify INT NOT NULL,
unitary_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES `order`(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);
