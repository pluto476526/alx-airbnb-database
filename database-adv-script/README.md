
````markdown
# SQL Join Queries for AirBnB Platform

This README explains three key SQL queries. Each query demonstrates a different type of SQL join: `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`. These joins are used to retrieve relational data across multiple tables.

---

## 1. Bookings with User Information (INNER JOIN)

**Purpose**  
This query retrieves all bookings along with the corresponding user who made each booking. It uses an `INNER JOIN` to ensure that only bookings linked to existing users are returned.

**Use Case**  
Useful for generating reports or views that include booking details and the user information, such as names and email addresses.

**SQL Query**
```sql
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.user_id,
    bookings.start_date,
    bookings.end_date,
    users.first_name,
    users.last_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.user_id;
````

**Explanation**

* Only records that have a match in both `bookings` and `users` tables will appear.
* This ensures all bookings are valid and associated with registered users.

---

## 2. Properties and Their Reviews (LEFT JOIN)

**Purpose**
This query retrieves all properties and their associated reviews. If a property has no reviews, it will still appear in the results with `NULL` values for the review fields.

**Use Case**
Ideal for displaying property listings on a website, whether or not they have been reviewed.

**SQL Query**

```sql
SELECT 
    properties.property_id,
    properties.title,
    properties.location,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.property_id = reviews.property_id;
```

**Explanation**

* All properties will be shown.
* If a property has one or more reviews, those will be displayed.
* If a property has no reviews, the review columns will be `NULL`.

---

## 3. All Users and All Bookings (FULL OUTER JOIN)

**Purpose**
This query retrieves all users and all bookings, including:

* Users who have never made a booking.
* Bookings that are not currently associated with any user (possibly due to data inconsistency).

**Use Case**
Useful for auditing, debugging data inconsistencies, or performing comprehensive reporting that does not exclude unmatched records.

### Standard SQL Version (if supported by your database)

```sql
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.user_id = bookings.user_id;
```



# SQL Subquery Examples

Subqueries allow us to perform conditional logic based on aggregated or related data.

---

## 1. Properties with Average Rating Greater Than 4.0

**Purpose**
This query retrieves all properties whose average review rating exceeds 4.0. It uses a **non-correlated subquery** in the `WHERE` clause to calculate average ratings grouped by property.

**Use Case**
Useful for displaying high-rated properties or filtering listings based on customer satisfaction.

**SQL Query**
```sql
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
````

**Explanation**

* The subquery selects `property_id` values with an average rating above 4.0.
* The outer query retrieves full details for those properties.
* `HAVING AVG(rating) > 4.0` ensures only well-reviewed properties are returned.

---

## 2. Users with More Than 3 Bookings

**Purpose**
This query retrieves users who have made more than three bookings. It uses a **correlated subquery**, which references the outer query's user for each evaluation.

**Use Case**
Ideal for identifying frequent users, rewarding loyal customers, or performing user segmentation.

**SQL Query**

```sql
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
```

**Explanation**

* For each user in the `users` table, the subquery counts how many bookings that user has made.
* Only users with more than 3 bookings are included in the final result.
* The correlation occurs through `b.user_id = u.user_id`.

---

