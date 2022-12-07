-- DB TABLES SCHEMA
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    UNIQUE(first_name, last_name)
);

CREATE TABLE bikes (
    short_name VARCHAR(30) PRIMARY KEY,
    full_model_name VARCHAR(30) NOT NULL UNIQUE,
    base_cost NUMERIC(10,2) NOT NULL,
    UNIQUE(short_name, full_model_name, base_cost)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers,
    -- total_cost NUMERIC(10,2) NOT NULL, -- NOT NECESSARY
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(customer_id, created_at)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY, -- NECESSARY
    order_id_reference INT NOT NULL REFERENCES orders,
    bike_model VARCHAR(30) NOT NULL REFERENCES bikes, -- references bike short name
    sold_price NUMERIC(10,2) NOT NULL,
    notes TEXT NOT NULL DEFAULT '', -- WHY IS THIS NOT NULL?
    -- // notes VARCHAR(255)
    UNIQUE(order_id_reference, bike_model, sold_price, notes)
);

-- INSERT VALUES
-- customers values
INSERT INTO customers(first_name, last_name)
    VALUES('Chris', 'Maltez'), ('Rox', 'Money'), ('Kevin','Maltez'),('Bri', 'Maltez');

-- bikes values
INSERT INTO bikes(short_name, full_model_name, base_cost)
    VALUES
    ('FLY','The Flyer', 500),
    ('HAUL', 'The Big Haul', 600),
    ('SKIN', 'The Skinny', 700),
    ('BUD', 'Big Buddy', 800);

-- orders values
INSERT INTO orders(customer_id, created_at)
    VALUES
    (1, CURRENT_TIMESTAMP),
    (2, CURRENT_TIMESTAMP),
    (3, CURRENT_TIMESTAMP);

-- order_items values
INSERT INTO order_items(order_id_reference, bike_model, sold_price, notes)
    VALUES
    (1, 'FLY', 500, 'No kickstand'),
    (1, 'BUD', 750, 'Training wheels'),
    (2, 'HAUL', 600, 'Big Seat'),
    (3, 'SKIN', 700, '');


