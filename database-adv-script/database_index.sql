-- Create Indexes on High-Usage Columns

-- Users table
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);

-- Bookings table
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);

-- Properties table
CREATE INDEX IF NOT EXISTS idx_properties_property_id ON properties(property_id);

-- Reviews table
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);


-- Performance Analysis Section

-- Before adding indexes
-- EXPLAIN ANALYZE
-- SELECT property_id, COUNT(*) AS total_bookings
-- FROM bookings
-- GROUP BY property_id
-- ORDER BY total_bookings DESC;

-- After adding indexes
EXPLAIN ANALYZE
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank_row
FROM 
    bookings
GROUP BY 
    property_id;

