-- Analysis 2: Drivers of Average Order Value (AOV)
--
-- Business Question:
-- What factors most strongly differentiate average order value (AOV)?
--
-- Definitions:
-- AOV (Average Order Value) = AVG(quantity * unit_price) at the chosen grouping level.
--
-- Assumptions:
-- 1) revenue is gross order value (quantity * unit_price), not net revenue (refunds not modeled)
-- 2) all order statuses are included unless explicitly filtered
-- 3) core.orders has quantity (int) and unit_price (numeric)
--
-- Data Sources:
-- core.orders, core.products, core.users
--
-- Output:
-- Multiple result sets:
-- (A) Overall baseline
-- (B) AOV by product category
-- (C) AOV by customer segment (country, age_group)
-- (D) AOV by price bucket (NTILE over unit_price)
--
-- Recommended usage:
-- Run each block separately in pgAdmin (highlight + execute), or run all and review outputs sequentially.
------------------------------------------------------------
-- (A) Baseline: overall AOV + dispersion
------------------------------------------------------------
SELECT
  COUNT(DISTINCT order_id) AS order_count,
  AVG(revenue) AS avg_order_value,
  STDDEV_SAMP(revenue) AS sd_order_value
FROM core.orders;

------------------------------------------------------------
-- (B) AOV by product category (top categories by revenue)
------------------------------------------------------------
SELECT
  p.category,
  COUNT(DISTINCT o.order_id) AS order_count,
  SUM(o.revenue) AS total_revenue,
  AVG(o.revenue) AS avg_order_value,
  STDDEV_SAMP(o.revenue) AS sd_order_value
FROM core.orders o
JOIN core.products p
  ON o.product_id = p.product_id
GROUP BY p.category
HAVING COUNT(DISTINCT o.order_id) >= 50
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- (C1) AOV by customer country (top 10 by order volume)
------------------------------------------------------------
WITH country_orders AS (
  SELECT
    u.country,
    COUNT(DISTINCT o.order_id) AS order_count,
    AVG(o.revenue) AS avg_order_value,
    SUM(o.revenue) AS total_revenue
  FROM core.orders o
  JOIN core.users u
    ON o.customer_id = u.customer_id
  GROUP BY u.country
)
SELECT *
FROM country_orders
ORDER BY order_count DESC
LIMIT 10;

------------------------------------------------------------
-- (C2) AOV by age_group (requires core.users.age_group)
------------------------------------------------------------
SELECT
  u.age_group,
  COUNT(DISTINCT o.order_id) AS order_count,
  SUM(o.revenue) AS total_revenue,
  AVG(o.revenue) AS avg_order_value
FROM core.orders o
JOIN core.users u
  ON o.customer_id = u.customer_id
GROUP BY u.age_group
HAVING COUNT(DISTINCT o.order_id) >= 50
ORDER BY avg_order_value DESC;

------------------------------------------------------------
-- (D) AOV by price bucket (unit_price deciles)
-- Explanation:
-- We bucket orders by unit_price deciles to see how pricing relates to AOV.
------------------------------------------------------------
WITH priced AS (
  SELECT
    o.*,
    NTILE(10) OVER (ORDER BY o.unit_price) AS price_decile
  FROM core.orders o
)
SELECT
  price_decile,
  COUNT(DISTINCT order_id) AS order_count,
  MIN(unit_price) AS min_unit_price,
  MAX(unit_price) AS max_unit_price,
  AVG(quantity * unit_price) AS avg_order_value,
  SUM(quantity * unit_price) AS total_revenue
FROM priced
GROUP BY price_decile
ORDER BY price_decile;

------------------------------------------------------------
-- (E) Optional: Excluding cancelled/returned to approximate realized sales
-- Use this only if you want a "delivered-like" view of AOV.
------------------------------------------------------------
SELECT
  o.order_status,
  COUNT(DISTINCT o.order_id) AS order_count,
  AVG(o.revenue) AS avg_order_value,
  SUM(o.revenue) AS total_revenue
FROM core.orders o
WHERE o.order_status NOT IN ('Cancelled', 'Returned')
GROUP BY o.order_status
ORDER BY total_revenue DESC;