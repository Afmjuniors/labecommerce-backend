-- Active: 1673961752633@@127.0.0.1@3306
-
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);
CREATE TABLE products (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE purchases (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    total_price REAL NOT NULL,
    paid INTEGER NOT NULL,
    delivered_at TEXT,
    buyer_id TEXT NOT NULL,
    FOREIGN KEY (buyer_id) REFERENCES users(id)
);


PRAGMA table_info("users");

--Simulação de API
--getAllusers
SELECT * FROM users;

--getAllProducts
SELECT * FROM products;
--getAllPurchase
SELECT * FROM purchases;

--getUserByName
SELECT * FROM users
WHERE email LIKE "%gmail%";

--createNewUser
INSERT INTO users (id,email,password)
VALUES
("u01","a@gmail.com","1a@A");

--createNewProduct
INSERT INTO products (id,name,price,category)
VALUES('p01','produto 1',10.1,'Eletrônicos');

--createNewPurchase
INSERT INTO purchases(id,total_price,paid,buyer_id)
VALUES
('ph001',20.20,0,'u01'),
('ph002',30.30,0,'u01'),
('ph003',60.99,0,'u02'),
('ph004',30.99,0,'u02'),
('ph005',10.99,0,'u03'),
('ph006',11.99,0,'u03');


--getProductByID
SELECT * FROM products
WHERE id='p01';

--getPurchaseByUserId
SELECT * FROM purchases
WHERE buyer_id='u01';

--deleteUserByID
DELETE FROM users WHERE id='u01';

--delteProductByID
DELETE FROM products WHERE id='p01';

--editUserByID
UPDATE users 
SET 
email="nv@gmail.com",
password="1" 
WHERE id='u01';

--editProductByID
UPDATE products
SET 
name="nome update",
price =1, 
category="Eletrônicos"
WHERE id="p02";

--editPurchaseDelivred
UPDATE purchases
SET 
paid=1,
delivered_at= DATETIME('now')
WHERE id = 'ph001';

--getAllUserOrdenado crescente
SELECT * FROM users
ORDER BY email ASC;

--getProducts order by pric ASC limit 20 offset 0
SELECT * FROM products
ORDER BY price ASC
LIMIT 20 OFFSET 0;

--getProducts entre precos 1 a 20 order ASC
SELECT * FROM products
WHERE price>=1 AND price <=20
ORDER BY price ASC;
