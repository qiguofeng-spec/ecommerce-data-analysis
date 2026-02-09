--Create 3 schema
CREATE SCHEMA raw;
CREATE SCHEMA core;
CREATE SCHEMA analytics;
--Create table for raw
CREATE TABLE raw.ecom_raw (
  customer_id     TEXT,
  first_name      TEXT,
  last_name       TEXT,
  gender          TEXT,
  age_group       TEXT,
  signup_date     TEXT,
  country         TEXT,
  product_id      TEXT,
  product_name    TEXT,
  category        TEXT,
  quantity        TEXT,
  unit_price      TEXT,
  order_id        TEXT,
  order_date      TEXT,
  order_status    TEXT,
  payment_method  TEXT,
  rating          TEXT,
  review_text     TEXT,
  review_id       TEXT,
  review_date     TEXT
);
--Separate the table into three cores.
--user
CREATE TABLE core.users AS
SELECT DISTINCT
  customer_id,
  first_name,
  last_name,
  gender,
  age_group,
  NULLIF(signup_date, '')::date AS signup_date,
  country
FROM raw.ecom_raw;
--product
CREATE TABLE core.products AS
SELECT DISTINCT
  product_id,
  product_name,
  category
FROM raw.ecom_raw;
--orders
DROP TABLE IF EXISTS core.orders;

CREATE TABLE core.orders AS
SELECT
  order_id,
  customer_id,
  product_id,
  NULLIF(order_date, '')::date AS order_date,
  NULLIF(order_status, '') AS order_status,
  NULLIF(payment_method, '') AS payment_method,
  NULLIF(quantity, '')::int AS quantity,
  NULLIF(unit_price, '')::numeric(12,2) AS unit_price,
  NULLIF(rating, '')::int AS rating,
  (NULLIF(quantity, '')::int * NULLIF(unit_price, '')::numeric(12,2))::numeric(12,2) AS revenue
  
FROM raw.ecom_raw;
--reviews
CREATE TABLE core.reviews AS
SELECT
  review_id,
  customer_id,
  product_id,
  order_id,
  NULLIF(review_date, '')::date AS review_date,
  NULLIF(rating, '')::numeric(3,1) AS rating,
  NULLIF(review_text, '') AS review_text
FROM raw.ecom_raw
WHERE NULLIF(review_id, '') IS NOT NULL;
