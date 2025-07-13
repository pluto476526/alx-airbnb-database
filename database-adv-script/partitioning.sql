-- Step 1: Rename original bookings table for backup
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create partitioned bookings table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status TEXT,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(property_id)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions by year
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Copy data from old table into the new partitioned table
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status)
SELECT booking_id, user_id, property_id, start_date, end_date, status
FROM bookings_old;

-- Step 5: Drop the old table if all is verified
-- DROP TABLE bookings_old;

