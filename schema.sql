-- 1. TABELITE LOOMINE (Baasstruktuur)
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL
);

-- 2. VÕÕRVÕTMETE LISAMINE (Andmete terviklikkus)
-- Seome tellimused klientidega. Kui klient kustutatakse, kustuvad ka tellimused.
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(id)
ON DELETE CASCADE;

-- Seome tellimuse read tellimustega.
ALTER TABLE order_items
ADD CONSTRAINT fk_items_orders
FOREIGN KEY (order_id) REFERENCES orders(id)
ON DELETE CASCADE;

-- Seome tellimuse read toodetega.
ALTER TABLE order_items
ADD CONSTRAINT fk_items_products
FOREIGN KEY (product_id) REFERENCES products(id)
ON DELETE CASCADE;

-- 3. INDEKSITE LISAMINE (Päringute kiirendamine)
-- Lisame indeksid väljadele, mida kasutatakse JOIN-ide ja WHERE tingimuste puhul.
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- 4. NÄIDISANDMED TESTIMISEKS (Et saaksid kontrollida)
INSERT INTO customers (name, email) VALUES ('Jaan Tamm', 'jaan@tamm.ee');
INSERT INTO products (name, price) VALUES ('Sülearvuti', 1200.00), ('Hiir', 25.00);
INSERT INTO orders (customer_id, order_date) VALUES (1, CURDATE());
INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 1, 1), (1, 2, 1);
