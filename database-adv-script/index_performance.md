# Index Performance Report

This document reports performance measurements before and after applying indexes to frequently queried columns in the `Users`, `Bookings`, and `Properties` tables.

---

## 📌 Identified Columns for Indexing

| Table        | Column          | Use Case                             |
|--------------|------------------|--------------------------------------|
| users        | user_id          | JOIN with bookings                   |
| bookings     | user_id          | JOIN, subqueries                     |
| bookings     | property_id      | GROUP BY, JOIN, ORDER BY             |
| bookings     | start_date       | WHERE, ORDER BY                      |
| properties   | property_id      | JOIN, filtering                      |
| reviews      | property_id      | JOIN, filtering                      |

Indexes were created using the `CREATE INDEX` command to improve query execution performance, especially for analytical queries and joins.

---

## 🧪 Performance Test Query

Tested the following aggregation query that groups bookings by property and ranks them by total bookings:

```sql
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank_row
FROM 
    bookings
GROUP BY 
    property_id;

