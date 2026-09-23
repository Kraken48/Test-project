-- Shop API QA Portfolio — SQL verification examples
-- These queries use the fictional schema described in the project documentation.
-- Boolean syntax (TRUE/FALSE) may vary between database systems.

-- 1. Get all products
SELECT *
FROM products;

-- 2. Get a specific product by ID
SELECT *
FROM products
WHERE id = 3;

-- 3. Get available products
SELECT *
FROM products
WHERE available = TRUE;

-- 4. Get available products cheaper than 10,000
SELECT *
FROM products
WHERE available = TRUE
  AND price < 10000;

-- 5. Get users younger than 18 or older than 65
SELECT *
FROM users
WHERE age < 18
   OR age > 65;

-- 6. Get users in the 18–65 range (inclusive)
SELECT *
FROM users
WHERE age >= 18
  AND age <= 65;

-- 7. Sort products from most expensive to cheapest
SELECT *
FROM products
ORDER BY price DESC;

-- 8. Count available products
SELECT COUNT(*)
FROM products
WHERE available = TRUE;

-- 9. Find users whose email ends with @mail.com
SELECT *
FROM users
WHERE email LIKE '%@mail.com';

-- 10. Find users without an email
SELECT *
FROM users
WHERE email IS NULL;

-- 11. Find users with an email
SELECT *
FROM users
WHERE email IS NOT NULL;

-- 12. Join users with their orders
SELECT users.name, orders.id, orders.total
FROM users
JOIN orders ON users.id = orders.user_id;

-- 13. Find users whose orders exceed 3,000
SELECT users.name, orders.id, orders.total
FROM users
JOIN orders ON users.id = orders.user_id
WHERE orders.total > 3000;

-- 14. Find users who have no orders
SELECT users.name
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- 15. Verify a newly created user by email
SELECT id, name, email, age
FROM users
WHERE email = 'new@mail.com';

-- 16. Verify an updated user value
SELECT id, age
FROM users
WHERE id = 157
  AND age = 31;

-- 17. Verify that a deleted user no longer exists
SELECT COUNT(*)
FROM users
WHERE id = 157;
-- Expected result after a successful deletion: 0
