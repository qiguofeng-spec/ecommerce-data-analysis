Analysis 1: Order Status Performance
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
## Executive Summary

Analysis shows that order status does not meaningfully differentiate
revenue or customer satisfaction metrics. Average order value varies
by ~8.5% across statuses, while average customer ratings vary by <2%.

This suggests that order_status is a weak segmentation variable and
likely reflects post-order operational states rather than drivers of
economic or experiential outcomes.

## Analysis 1: Impact of Order Status on Revenue and Customer Experience
Objective

This analysis examines whether different order statuses (Delivered, Shipped, Cancelled, Pending, Returned) are associated with meaningful differences in revenue performance and customer experience. Specifically, we compare order volume, total revenue, average order value (AOV), and average customer rating across order status groups.

Key Results Summary
Order Status	Order Count	Total Revenue	Avg Order Value	Avg Rating
Delivered	      2037	1,582,371	         776.81	          2.996
Shipped	          2063	1,560,090	         756.22	          3.013
Cancelled	      1970	1,499,341	         761.09	          2.997
Pending	          1968	1,414,807	         718.91	          2.950
Returned	      1962	1,394,154	         710.58	          3.009
Observations

Order distribution is highly balanced
Each order status contains roughly 2,000 records, indicating that the dataset does not exhibit strong class imbalance. This suggests that any observed differences are unlikely to be driven by sample size effects.

Revenue and AOV show limited variation across statuses

Average order value ranges from approximately 710 to 777, a relative spread of about 8.5%.

Total revenue is also similar across groups, despite intuitive expectations that cancelled or returned orders should generate substantially less revenue.

Customer ratings are nearly uniform

Average ratings cluster tightly around 3.0, with less than 2% relative variation across order statuses.

No order status exhibits a clearly superior or inferior customer experience based on ratings alone.

Interpretation & Hidden Insights

At first glance, the results suggest that order status has little observable impact on revenue or customer satisfaction. However, this apparent lack of difference is itself an important signal.

Order status appears to be weakly causal
The similarity in revenue and AOV across Delivered, Cancelled, and Returned orders indicates that order_status may function primarily as a post-hoc label rather than a driver of economic outcomes. In other words, financial metrics are largely determined before the final order status is assigned.

Revenue attribution likely precedes fulfillment resolution
The fact that cancelled and returned orders still contribute substantial revenue suggests one of the following:

Revenue is recorded at order placement rather than final fulfillment.

Refund or reversal mechanisms are not modeled in the dataset.

This highlights a structural limitation of the data: order status does not reflect the full financial lifecycle of a transaction.

Customer ratings may not align with fulfillment outcomes
The absence of meaningful rating differences implies that customer satisfaction is influenced by factors beyond final order status, such as product quality, pricing, or brand expectations. This suggests that using order_status alone as a proxy for customer experience would be misleading.

Analytical Implications

From a business analytics perspective, order status is not a strong segmentation variable for revenue or experience optimization.

The small observed differences, while potentially statistically testable, lack clear practical significance.

Further analysis should focus on variables upstream of fulfillment (e.g., product category, price, customer demographics) or downstream adjustments (e.g., refunds, repeat behavior).

Conclusion

This analysis demonstrates that not all intuitive dimensions produce actionable insights. While order status is operationally important, it does not meaningfully differentiate revenue performance or customer satisfaction in this dataset. Recognizing such non-informative dimensions is a critical analytical skill, as it helps redirect attention toward more impactful drivers of business outcomes.


Optional Statistical Check:
Given the similar group means, a one-way ANOVA was considered to test whether observed differences in average order value could be attributed to random variation. However, due to the synthetic nature of the dataset and the lack of a clear causal relationship between order status and revenue, statistical significance was not treated as the primary decision criterion.