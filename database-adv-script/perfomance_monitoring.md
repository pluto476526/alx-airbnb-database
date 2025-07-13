# Continuous Performance Monitoring Report

This report documents the process of monitoring query performance using tools such as `EXPLAIN ANALYZE` and `SHOW PROFILE`, identifying bottlenecks, and implementing improvements.

---

## Tools Used

- `EXPLAIN ANALYZE` (PostgreSQL)
- `SHOW PROFILE` (MySQL)
- Manual index inspection

---

## Monitored Queries

### 1. Bookings with User and Property Details

```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id, b.start_date, b.end_date,
    u.first_name, p.title
FROM 
    bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE 
    b.start_date >= '2024-01-01' AND b.status = 'confirmed';

Observation:

    Full table scan on bookings

    Join filters not using indexes

2. Payment Summaries by Property

EXPLAIN ANALYZE
SELECT 
    p.property_id, p.title, SUM(pay.amount) AS total_revenue
FROM 
    payments pay
JOIN bookings b ON pay.booking_id = b.booking_id
JOIN properties p ON b.property_id = p.property_id
GROUP BY p.property_id, p.title;

Observation:

    Expensive GROUP BY operation

    Missing index on payments.booking_id


Bottlenecks Identified
Issue	                            Cause	                        Affected Query
Seq Scan on bookings	            Missing index on start_date	    Query 1
Slow joins on payments.booking_id	No index on foreign key	        Query 2



