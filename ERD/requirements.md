
### **Entities and Attributes**

#### **User**

* `user_id` (PK)
* `first_name`
* `last_name`
* `email` (UNIQUE, Indexed)
* `password_hash`
* `phone_number`
* `role` (ENUM: guest, host, admin)
* `created_at`

#### **Property**

* `property_id` (PK)
* `host_id` (FK → User.user\_id)
* `name`
* `description`
* `location`
* `pricepernight`
* `created_at`
* `updated_at`

#### **Booking**

* `booking_id` (PK)
* `property_id` (FK → Property.property\_id)
* `user_id` (FK → User.user\_id)
* `start_date`
* `end_date`
* `total_price`
* `status` (ENUM: pending, confirmed, canceled)
* `created_at`

#### **Payment**

* `payment_id` (PK)
* `booking_id` (FK → Booking.booking\_id)
* `amount`
* `payment_date`
* `payment_method` (ENUM: credit\_card, paypal, stripe)

#### **Review**

* `review_id` (PK)
* `property_id` (FK → Property.property\_id)
* `user_id` (FK → User.user\_id)
* `rating` (1–5)
* `comment`
* `created_at`

#### **Message**

* `message_id` (PK)
* `sender_id` (FK → User.user\_id)
* `recipient_id` (FK → User.user\_id)
* `message_body`
* `sent_at`

---

### **Relationships**

* **User – Property**:
  One-to-Many (a user with role `host` can list many properties)
  `User.user_id` → `Property.host_id`

* **User – Booking**:
  One-to-Many (a guest can make many bookings)
  `User.user_id` → `Booking.user_id`

* **Property – Booking**:
  One-to-Many (a property can have many bookings)
  `Property.property_id` → `Booking.property_id`

* **Booking – Payment**:
  One-to-One (each booking has one payment record)
  `Booking.booking_id` → `Payment.booking_id`

* **User – Review – Property**:
  Many-to-Many through Review
  `User.user_id` → `Review.user_id`
  `Property.property_id` → `Review.property_id`

* **User – Message – User**:
  Many-to-Many through Message
  `User.user_id` → `Message.sender_id`
  `User.user_id` → `Message.recipient_id`

---


