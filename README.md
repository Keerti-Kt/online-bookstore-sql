# online-bookstore-sql
SQL-based analysis of transactional bookstore data (Books, Customers, Orders) to generate KPIs like top-selling books and high-value customers.

## Overview
This repo contains PostgreSQL queries that analyze an online bookstore dataset across three relational tables: `books`, `customers`, and `orders`. The analysis focuses on sales trends, top selling books, top selling genre of books, city-wise sales trends, and customer spending behavior.

## Tools
- PostgreSQL / SQL

## Process
1. Performed data cleaning and normalization via SQL (handled NULLs, used `COALESCE` for missing values).
2. Used multi-table `JOIN's and 'GROUP By' to compute KPIs.
3. Generated reports: top-selling books, top spending customers, revenue by city.

## Key Queries
- Multi-table joins (inner/left/full joins)
- Aggregations (sum, count, and avg)
- COALESCE for null handling.
- KPI calculations.

## Files
- `online-bookstore-sql` - all key queries
- `query_result_screenshot.png` `query_results_screenshot.png` - screenshot of query results.
  
