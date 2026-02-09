Analysis 2: Drivers of Average Order Value (AOV)
Business Question

Which factors meaningfully differentiate average order value (AOV) in this e-commerce dataset, and where should the business focus to improve revenue per order?

Metric Definition

AOV (Average Order Value) = average of (quantity × unit_price)

Total Revenue = sum of (quantity × unit_price)

Revenue is treated as gross order value; refunds are not explicitly modeled.

Dataset Overview

Total orders analyzed: 10,000

Overall average order value: ≈ 745

Order value standard deviation: ≈ 1,012, indicating high dispersion across orders

Key Results
1. Product Category Is the Strongest AOV Driver
Category	Order Count	 Avg Order Value
Electronics	   2,616	   1,731
Home & Kitchen 1,391	   769
Toys	       1,314	   380
Books	       1,334	   312
Apparel	       2,047	   292
Sports	       1,298	   260

Observation:
Electronics orders generate more than 5× the AOV of Apparel and Sports, despite similar order volumes across categories.

Interpretation:
Revenue concentration is driven primarily by product mix, not by customer behavior or geography. Improvements in AOV are far more likely to come from promoting high-value categories than increasing order frequency in low-value ones.

2. Customer Age Group Has Limited Impact on AOV
Age Group	Order Count	Avg Order Value
Adults	      3,299	      773
Teenagers	  3,359	      748
Seniors	      3,342	      714

Observation:
Differences across age groups are modest (≈ 8% range).

Interpretation:
Customer age segmentation provides weak explanatory power for AOV. Spending differences are minor relative to category-driven effects.

3. Country Differences Exist but Are Not Decisive

Top countries by order volume show average order values clustered between ~715 and ~797, with no country dominating revenue per order.

Interpretation:
Geographic segmentation alone does not explain AOV variation. Country effects are secondary compared to product pricing and category structure.

4. Pricing Structure Explains AOV Variation Almost Monotonically
Price Decile	Unit Price Range	Avg Order Value
1 (lowest)	       25 – 59	             110
5	               110 – 129	         367
8	               199 – 229	         648
9	               229 – 899	         1,636
10 (highest)	   899 – 999	         2,904

Observation:
AOV increases sharply and consistently with unit price deciles.

Interpretation:
AOV is primarily price-driven, not quantity-driven. Higher-priced items dominate revenue contribution even when order counts are identical across deciles.

Overall Interpretation

Product category and unit price are the dominant drivers of AOV.

Customer demographics (age, country) exhibit limited practical impact.

High dispersion in order value indicates that focusing on high-value product segments yields far greater returns than broad demographic targeting.

In practical terms, improving revenue per order would be more effectively achieved through pricing strategy, product assortment optimization, and promotion of high-value categories, rather than customer segmentation or operational factors such as order status.

Key Takeaway

Not all intuitive segmentation variables are useful. This analysis shows that what is sold and at what price matters far more than who buys it or where they are located, highlighting the importance of product-centric revenue strategy.
