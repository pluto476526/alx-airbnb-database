-- 1. Total number of bookings made by each user
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id;

-- 2. Rank properties based on total number of bookings
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_booking,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_booking
FROM 
    bookings
GROUP BY 
    property_id;

