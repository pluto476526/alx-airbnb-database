# Airbnb Database Schema - SQL DDL

## Overview

This project defines a relational database schema for an Airbnb-like platform. It includes SQL `CREATE TABLE` statements, constraints, and indexes to structure and optimize the data storage for users, properties, bookings, payments, reviews, and messages.

The schema follows best practices for normalization (up to 3NF) and enforces data integrity through primary keys, foreign keys, and check constraints.

---

## Table Descriptions

### 1. `users`
Stores user information including guests, hosts, and administrators.

- **Primary Key**: `user_id` (UUID)
- **Constraints**:
  - `email` must be unique.
  - `role` must be one of `'guest'`, `'host'`, or `'admin'`.

### 2. `properties`
Represents property listings created by users with role `host`.

- **Primary Key**: `property_id` (UUID)
- **Foreign Key**: `host_id` references `users(user_id)`
- **Fields**:
  - Includes details like name, description, location, and price per night.

### 3. `bookings`
Captures booking data for users reserving properties.

- **Primary Key**: `booking_id` (UUID)
- **Foreign Keys**:
  - `user_id` references `users(user_id)`
  - `property_id` references `properties(property_id)`
- **Constraints**:
  - `status` must be one of `'pending'`, `'confirmed'`, or `'canceled'`.

### 4. `payments`
Records payment transactions for confirmed bookings.

- **Primary Key**: `payment_id` (UUID)
- **Foreign Key**: `booking_id` references `bookings(booking_id)`
- **Constraints**:
  - `payment_method` must be one of `'credit_card'`, `'paypal'`, or `'stripe'`.

### 5. `reviews`
Allows users to leave reviews for properties.

- **Primary Key**: `review_id` (UUID)
- **Foreign Keys**:
  - `user_id` references `users(user_id)`
  - `property_id` references `properties(property_id)`
- **Constraints**:
  - `rating` must be an integer between 1 and 5.

### 6. `messages`
Supports messaging between users.

- **Primary Key**: `message_id` (UUID)
- **Foreign Keys**:
  - `sender_id` and `recipient_id` both reference `users(user_id)`

---

## Indexes

Indexes have been added on frequently queried fields such as:

- `email` in the `users` table
- `property_id` in `properties` and `bookings`
- `booking_id` in `bookings` and `payments`

These indexes enhance performance on lookups, filtering, and joins.

---

## Notes

- Timestamps (`created_at`, `updated_at`, etc.) use the default `CURRENT_TIMESTAMP` to auto-record creation or update times.
- UUIDs are used as primary keys for global uniqueness and better scalability.
- All foreign key constraints enforce referential integrity between related entities.

---

