DROP TABLE shoes;
DROP TABLE brands;

CREATE TABLE brands (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE shoes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  stock_quantity INT4,
  stock_cost INT4,
  selling_price INT4,
  brand_id INT4 REFERENCES brands(id) ON DELETE CASCADE
)
