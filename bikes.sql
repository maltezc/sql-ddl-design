-- DB TABLES SCHEMA
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    short_name VARCHAR(30) PRIMARY KEY,
    full_model_name VARCHAR(30) NOT NULL UNIQUE,
    base_cost NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id NOT NULL REFERENCES customers,
    -- total_cost NUMERIC(10,2) NOT NULL, -- NOT NECESSARY
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY, -- NECESSARY
    order_id_reference INT NOT NULL REFERENCES orders,
    bike_model VARCHAR(30) NOT NULL REFERENCES bikes, -- references bike short name
    sold_price NUMERIC(10,2) NOT NULL,
    notes TEXT NOT NULL DEFAULT ''
    -- // notes VARCHAR(255)
);

-- INSERT VALUES
INSERT INTO customers(first_name, last_name)
    VALUES('Chris', 'Maltez'), ('Rox', 'Money'), ('Kevin','Maltez'),('Bri', 'Maltez');

INSERT INTO bikes(short_name, full_model_name, base_cost)
