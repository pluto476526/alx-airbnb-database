# Airbnb Database Normalization to 3NF

## Objective
Ensure the Airbnb database schema is fully normalized to Third Normal Form (3NF) to eliminate redundancy, enforce data integrity, and improve consistency.

---

## 1. First Normal Form (1NF)
**Requirement**: All attributes must contain atomic values and each record must be unique.

✅ All entities already have atomic fields (e.g., `first_name`, `email`, `pricepernight`).  
✅ Each entity has a primary key ensuring uniqueness.

---

## 2. Second Normal Form (2NF)
**Requirement**: Must be in 1NF, and all non-key attributes must be fully functionally dependent on the **entire** primary key.

✅ Each table has a single-attribute primary key (e.g., `user_id`, `property_id`, etc.).  
✅ No partial dependencies exist since all non-key fields depend fully on the primary key.

---

## 3. Third Normal Form (3NF)
**Requirement**: Must be in 2NF and have no transitive dependencies (non-key attributes depending on other non-key attributes).

### 🔍 Review of Potential Transitive Dependencies:

#### User Table
- `user_id` → all fields  
✅ No transitive dependencies.

#### Property Table
- `property_id` → all fields  
✅ `host_id` is a foreign key, not a derived or computed field.  
✅ No derived fields like `host_name` that would violate 3NF.

#### Booking Table
- `booking_id` → all fields  
✅ All fields are dependent solely on `booking_id`.  
✅ `total_price` may seem derived (e.g., from nights × `pricepernight`) but is stored for historical accuracy and performance. This is a **denormalization for performance**, not a violation of 3NF.

#### Payment Table
- `payment_id` → all fields  
✅ No transitive dependency. All fields are directly related to the payment record.

#### Review Table
- `review_id` → all fields  
✅ No issues here. Relationships with `user_id` and `property_id` are valid foreign keys.

#### Message Table
- `message_id` → all fields  
✅ No transitive dependencies; all fields depend solely on `message_id`.

---


