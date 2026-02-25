# Global Superstore Sales & Profit Analysis

## Project Overview
This project analyzes the Global Superstore dataset to uncover insights related to sales performance, profitability, customer contribution, discount impact, and regional performance.

## The complete workflow follows an end-to-end business analytics approach:
* Data Cleaning & Transformation → Excel Power Query
* Business Analysis → SQL
* Visualization & Insights → Power BI Dashboard
* The objective was to convert raw transactional data into actionable business insights.

## Dataset Description
The dataset consists of transactional retail data including:
* Order Date
* Ship Date
* Customer Name
* Region
* Segment
* Category
* Sub-Category
* Sales
* Profit
* Discount
* Quantity
It represents multi-region retail operations across different customer segments and product categories.

## Data Cleaning & Transformation (Excel Power Query)
Data preprocessing was performed using Excel Power Query:
* Removed duplicates and null values
* Standardized region and category names
* Converted date columns into proper date format
* Created derived column:
* Delivery Days (Ship Date – Order Date)
* Checked for negative profit inconsistencies
* Structured the dataset for efficient SQL analysis
* Power Query ensured clean, reliable, and analysis-ready data before further processing.

## SQL Analysis
SQL was used to solve key business problems:
* Total Sales & Total Profit by Region
* Top 10 Customers by Total Profit
* Sub-Categories with Frequent Losses
* Discount vs Profit Relationship
* Category & Segment Performance
* Monthly Sales and Profit Trends
* Average Delivery Days Trend

Used:
* SUM(), AVG(), COUNT()
* GROUP BY & ORDER BY
* Subqueries
* Conditional filtering
* Aggregated discount analysis
* SQL helped validate and structure insights before dashboard visualization.

## Power BI Dashboard
The interactive Power BI dashboard includes:
* Sales & Profit Trends Over Time
* Average Delivery Days Trend
* Impact of Discounts on Profit (Scatter Plot)
* Sub-Categories with Frequent Losses
* Top 10 Customers by Profit
* Profit by Region
* Segment & Category Filters
* The dashboard enables quick decision-making through dynamic filtering and visual storytelling.

## Key Insights
* Certain sub-categories generate consistent losses despite strong sales.
* High discount percentages often reduce profitability.
* A small group of customers contribute a major portion of total profit.
* Regional performance varies significantly.
* Delivery performance shows seasonal variation.
* High sales do not always translate to high profit.

## Conclusion
This project demonstrates:
* Practical business data cleaning using Power Query
* Structured analytical thinking using SQL
* Data visualization and storytelling using Power BI
* End-to-end retail sales analytics capability
* It reflects real-world BI workflow used in organizations.
