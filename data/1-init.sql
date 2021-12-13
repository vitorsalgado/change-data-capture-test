CREATE TABLE  types (
  id SERIAL PRIMARY KEY,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  context TEXT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  type INTEGER NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_customer_type FOREIGN KEY (type) REFERENCES types (id)
);

CREATE TABLE customers_addresses (
  id SERIAL NOT NULL,
  customer_id INTEGER NOT NULL,
  street VARCHAR(1000),

  PRIMARY KEY (id, customer_id),

  CONSTRAINT fk_customers_addresses FOREIGN KEY (customer_id) REFERENCES customers (id)
);
