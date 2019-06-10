DROP TABLE stock_items;
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
  purchase_price INT4,
  selling_price INT4,
  brand_id INT4 REFERENCES brands(id) ON DELETE CASCADE
);

CREATE TABLE stock_items (
  id SERIAL4 PRIMARY KEY,
  quantity INT4,
  shoe_id INT4 REFERENCES shoes(id) ON DELETE CASCADE
)


-- create table stock_items (
--   id
--   shoe_id
--   quantity
-- )
