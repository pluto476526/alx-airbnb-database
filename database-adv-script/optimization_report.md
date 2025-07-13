# Query Optimization Report

This document outlines the process of analyzing and optimizing a query that joins `bookings`, `users`, `properties`, and `payments` tables.

---

## Initial Query Overview

The original query joins:
- `bookings` to `users` and `properties` using `INNER JOIN`
- `bookings` to `payments` using `LEFT JOIN`

This retrieves all booking records along with their related user, property, and (if available) payment information.

---

## Performance Analysis

**Tool Used**: `EXPLAIN ANALYZE`

### Key Observations:
- The query triggered **sequential scans** on all tables.
- Join filters used **non-indexed columns**.
- Join on `payments.booking_id` (LEFT JOIN) slowed down execution on large datasets.

---

## Refactored Query

**Improvements**:
- Ensure indexes exist on join columns:
  - `bookings.user_id`, `bookings.property_id`, `payments.booking_id`
- Avoid SELECTing unused columns.
- Keep joins but verify that filtering or pagination is handled at the application level.

**Refactored Query:**

```sql
-- Ensure indexes before running this query
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.email,
    p.title,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;

