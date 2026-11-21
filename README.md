End-to-End E-Commerce & Marketing Funnel Analytics (Python, PostgreSQL, Excel & Power BI)

📌 Business Overview
Analyzed multi-channel e-commerce performance for "maven fuzzy factory" across 6 relational tables (`500K+` website sessions and pageviews) to answer four core business questions:
1. Marketing Attribution: Which acquisition channels (`utm_source`) drive the highest website traffic and order conversions?
2. Revenue & Profitability: How have gross revenue and net profit margins grown over time across different product launches?
3. Product Quality & Returns: What is the overall product refund rate, and how much revenue is lost to returns?
4. Device Engagement: How does customer session volume split between desktop and mobile users?



🛠️ End-to-End Data Pipeline & Tech Stack
* Python (ETL & Data Cleaning): Built an automated cleaning workflow to standardize date/time formats, handle `NULL` strings, and categorize missing UTM marketing tags as `direct_or_organic`.
* PostgreSQL (Database & Analytical Views): Designed relational schemas, bulk-loaded cleaned datasets, and created pre-aggregated **SQL Views** (`vw_sales_performance` and `vw_marketing_sessions`) using `JOIN`, `GROUP BY`, `COALESCE`, and `CASE`.
* Microsoft Excel (Data Reconciliation): Exported SQL validation benchmarks (`validation_benchmark.xlsx`) to cross-check exact order counts, revenue, profit, and refund totals before dashboarding.
* Power BI & GenAI (Modeling & Interactive UI): Built a **Star Schema** data model with a custom DAX `Calendar` table, dynamic KPI measures, **3-Page Navigation** (`Overall View`, `Sales View`, `Marketing View`), multi-dimensional slicers with a `Reset Filter` button, and **Smart Narrative AI** insights.


📊 Key Metrics & Business Insights
1- Gross Revenue: $1.94M across "32,313 total orders"
2- Net Profit & Margin: $1.22M Net Profit (62.74% profit margin)
3- Funnel Conversion: 6.83% overall conversion rate across "473K website sessions"
4- Refund Tracking: $85.34K total refunds (4.32% refund rate), pinpointing opportunities for product quality optimization
5- Top Channel: Google Search (`gsearch`) drove the largest share of sessions and conversions, with desktop sessions outperforming mobile in conversion efficiency



📂 Repository Contents
* `maven_final.pbix` — Interactive Power BI Desktop dashboard featuring custom dark-mode UI, DAX measures, 3-page navigation, and Smart Narrative AI.
* `maven_final.pdf` — High-resolution export of all three dashboard pages (`Overall View`, `Sales View`, and `Marketing View`).
* `Maven_Fuzzy_Factory_Step_By_Step_Guide.pdf` — Complete technical documentation covering SQL queries, DAX formulas, and data modeling steps.
