-- Initial Query: Retrieve all bookings with user, property, and payment details

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;

EXPLAIN ANALYZE
SELECT 
     b.booking_id,
     b.start_date,
     b.end_date,
     u.user_id,
     u.first_name,
     u.last_name,
     u.email,
     p.property_id,
     p.title,
     p.location,
     pay.payment_id,
     pay.amount,
     pay.status
FROM 
     bookings b
JOIN 
     users u ON b.user_id = u.user_id
JOIN 
     properties p ON b.property_id = p.property_id
LEFT JOIN 
     payments pay ON b.booking_id = pay.booking_id;

