Analysis 3: Value vs. Customer Experience (AOV × Rating)
Business Question

Does higher order value come at the cost of lower customer satisfaction, or can value and customer experience improve together?

Metric Definition

AOV (Average Order Value) = average of (quantity × unit_price)

Average Rating = mean customer rating (1–5 scale)

Analysis is based on 10,000 orders from core.orders, enriched with product categories.

Baseline Overview

Overall AOV: ≈ 745

Overall average rating: ≈ 2.99

This establishes a neutral baseline for comparing value and experience across segments.

1. Price Segmentation: AOV vs Rating

Orders were divided into price deciles based on unit price (equal-sized groups of 1,000 orders).

Key pattern observed:

AOV increases monotonically and sharply from the lowest to the highest price decile

Lowest decile AOV: ≈ 114

Highest decile AOV: ≈ 2,909

Average ratings remain remarkably stable, fluctuating narrowly between ~2.95 and ~3.07 across all deciles.

Interpretation:
Higher-priced orders generate substantially more revenue per order, but do not meaningfully improve or degrade customer satisfaction. There is no strong evidence of a price–experience trade-off at the aggregate level.

2. Product Category Comparison
Category	Avg Order Value	Avg Rating
Electronics	   1,732	    3.02
Home & Kitchen	769	        2.97
Toys	        380	        3.01
Books	        312	        3.01
Apparel	        292	        2.98
Sports	        260	        2.94

Key observations:

Electronics stands out as a high-value category with above-average ratings, indicating strong value capture without compromising experience.

Lower-AOV categories (e.g., Apparel, Sports) do not consistently achieve higher ratings, suggesting that lower price does not guarantee better satisfaction.

Interpretation:
Customer experience appears to be category-specific rather than price-driven. Some high-value categories can maintain acceptable ratings, while low-value categories do not necessarily deliver superior experience.

3. High-Value Orders (Top 20% by Unit Price)

Avg AOV (top quintile): ≈ 2,270

Avg rating (top quintile): ≈ 2.98

Interpretation:
Even among the highest-value orders, customer ratings remain close to the global average. This further supports the conclusion that high revenue per order does not inherently damage customer satisfaction.

Overall Interpretation

Price and AOV scale strongly, but customer ratings remain largely invariant.

There is no clear negative correlation between order value and customer experience in this dataset.

Customer satisfaction is likely driven by factors beyond price alone, such as product expectations, quality consistency, or post-purchase experience.

Business Implications

Promoting higher-value products does not appear to introduce systemic customer dissatisfaction risk.

Revenue optimization strategies can safely focus on high-AOV categories (e.g., Electronics) without immediate concern for experience degradation.

Monitoring should focus on category-level anomalies, where high value and low ratings might diverge.

Conclusion

This analysis shows that value and customer experience are not inherently in conflict. In this dataset, higher order value delivers significantly greater revenue while customer satisfaction remains stable. The primary opportunity lies in identifying and scaling product categories that combine high AOV with consistently acceptable ratings.
