# Partitioning Performance Report

This report summarizes the implementation and performance impact of partitioning the `bookings` table by `start_date`.

---

## Objective

Improve query performance on the large `bookings` table by partitioning it based on `start_date`.

---

## Implementation

- Replaced the original `bookings` table with a partitioned version
- Partitioned by `RANGE (start_date)` into yearly partitions:
  - `bookings_2023`, `bookings_2024`, `bookings_2025`

---

## Query Tested

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';




| Metric                | Before Partitioning | After Partitioning |
| --------------------- | ------------------- | ------------------ |
| Scan Type             | Seq Scan            | Partition Pruning  |
| Execution Time (est.) | ~230 ms             | ~60 ms             |
| Rows Scanned          | Full table          | Single partition   |

