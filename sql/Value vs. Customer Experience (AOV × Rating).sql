-- Analysis 3: AOV vs Customer Rating
--
-- Business Question:
-- Is higher order value associated with better or worse customer experience?
-- Do high-value orders come at the cost of lower customer satisfaction?
--
-- Metrics:
-- AOV = AVG(revenue)
-- Avg Rating = AVG(rating)
--
-- Data:
-- core.orders joined with core.products
--
-- Notes:
-- rating is assumed numeric (e.g. 1–5)
------------------------------------------------------------
-- (A) Baseline: overall AOV and average rating
------------------------------------------------------------
SELECT
  COUNT(DISTINCT order_id) AS order_count,
  AVG(revenue) AS avg_order_value,
  AVG(rating) AS avg_rating
FROM core.orders;

------------------------------------------------------------
-- (B) Price deciles: AOV vs rating
------------------------------------------------------------
WITH priced AS (
  SELECT
    o.*,
    NTILE(10) OVER (ORDER BY unit_price) AS price_decile
  FROM core.orders o
)
SELECT
  price_decile,
  COUNT(DISTINCT order_id) AS order_count,
  AVG(revenue) AS avg_order_value,
  AVG(rating) AS avg_rating
FROM priced
GROUP BY price_decile
ORDER BY price_decile;

------------------------------------------------------------
-- (C) Product category: AOV vs rating
-- Only include categories with sufficient volume
------------------------------------------------------------
SELECT
  p.category,
  COUNT(DISTINCT o.order_id) AS order_count,
  AVG(o.revenue) AS avg_order_value,
  AVG(o.rating) AS avg_rating
FROM core.orders o
JOIN core.products p
  ON o.product_id = p.product_id
GROUP BY p.category
HAVING COUNT(DISTINCT o.order_id) >= 100
ORDER BY avg_order_value DESC;

------------------------------------------------------------
-- (D) High-value orders only (top 20% by unit price)
------------------------------------------------------------
WITH ranked AS (
  SELECT
    *,
    NTILE(5) OVER (ORDER BY unit_price) AS price_quintile
  FROM core.orders
)
SELECT
  price_quintile,
  COUNT(DISTINCT order_id) AS order_count,
  AVG(revenue) AS avg_order_value,
  AVG(rating) AS avg_rating
FROM ranked
WHERE price_quintile = 5
GROUP BY price_quintile;
