-- Analysis 1: Order Status Performance
--
-- Business Question:
-- How do different order statuses impact revenue and customer satisfaction?
--
-- Assumptions:
-- 1. Revenue is calculated as quantity * unit_price
-- 2. All order statuses are included in the analysis
-- 3. Ratings may be NULL if no review exists
--
-- Data Sources:
-- core.orders
-- core.reviews
SELECT
  order_status,
  COUNT(*) AS order_count,
  SUM(revenue) AS total_revenue,
  AVG(revenue) AS avg_order_value,
  AVG(rating) AS avg_rating,
FROM core.orders
GROUP BY order_status
ORDER BY total_revenue DESC;


