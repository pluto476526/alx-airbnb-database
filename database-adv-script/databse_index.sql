-- Index for joining and filtering on user_id in users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index for joining and filtering on user_id in bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for property_id in bookings table (used in GROUP BY and JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for ordering/filtering by start_date in bookings table
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index for joining and aggregating property_id in properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Index for property_id in reviews table (used in GROUP BY and JOIN)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

