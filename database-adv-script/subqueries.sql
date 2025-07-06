SELECT 
    property_id,
    title,
    location
FROM 
    properties
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );



SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    users u
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            bookings b
        WHERE
            b.user_id = u.user_id
    ) > 3;

