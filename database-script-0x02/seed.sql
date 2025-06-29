-- ==============================
-- Seed Data: Users
-- ==============================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hash2', '2345678901', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Lee', 'charlie@example.com', 'hash3', NULL, 'guest'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Ngugi', 'diana@example.com', 'hash4', '3456789012', 'host');

-- ==============================
-- Seed Data: Properties
-- ==============================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Cabin', 'Mountain cabin with a hot tub', 'Denver, CO', 120.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 'Modern Apartment', 'City center apartment with skyline view', 'Nairobi, KE', 80.00);

-- ==============================
-- Seed Data: Bookings
-- ==============================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-07-10', '2025-07-12', 160.00, 'pending');

-- ==============================
-- Seed Data: Payments
-- ==============================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
('ppppppp1-pppp-pppp-pppp-ppppppppppp1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, 'credit_card');

-- ==============================
-- Seed Data: Reviews
-- ==============================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrr1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Wonderful stay! Very clean and peaceful.'),
('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrr2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Great location, but a bit noisy at night.');

-- ==============================
-- Seed Data: Messages
-- ==============================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmm1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, is the cabin available on July 1st?'),
('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmm2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available. Looking forward to hosting you!');

