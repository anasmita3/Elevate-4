# Elevate-4
<br>
📌SQL for Data Analysis – Summary

Objective:
To explore and analyze the sales data using SQL queries, uncovering key business insights such as sales trends, top markets, and customer behavior.

Tools Used:

   Database: SQLite (portable and lightweight)

   Language: SQL (standard queries using SELECT, GROUP BY, JOIN, subqueries, views, and indexes)

   Data Source: sales_data_sample.csv

   Visuals: Query result screenshots generated with Python (matplotlib)

🔍 Key Insights

  📈 Total Sales by Year:
  The dataset spans multiple years, showing steady sales, with the highest total sales recorded in 2004.

  🌍 Top 5 Countries by Orders:
  The United States leads in total number of orders, followed by Spain, France, Australia, and Norway—indicating major market regions.

  📅 Monthly Order Value Trends (2003):
  Peaks in November and December suggest strong year-end sales performance, likely due to holiday season shopping.

  💸 Top Products by Revenue:
  Products such as S10_1678 and S18_1749 generated the most revenue, hinting at best-sellers that drive business success.

  🏅 High-Value Customers:
  Several customers, including Mini Gifts Distributors Ltd., consistently purchase above the average, marking them as VIP clients.

  🔄 Discount Analysis (Revenue vs MSRP):
  By comparing actual revenue with MSRP, the analysis reveals products sold at the highest discounts. This can inform pricing strategy and promotion evaluations.

🛠️ Technical Highlights

  JOINS used to compare sales and MSRP data from the product table.

  Subqueries employed to identify customers exceeding average spending.

  Aggregate functions like SUM, AVG, and COUNT used throughout.

  Views created for reusable grouped analysis.

  Indexes recommended on key fields (ORDERNUMBER, CUSTOMERNAME, PRODUCTCODE) to optimize performance.
