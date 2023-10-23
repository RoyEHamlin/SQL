/* Notes */
-- Table names with spaces
  -- "table name" 
  -- [table name]


-- Question 1
SELECT *
FROM orders;

-- Question 2
SELECT id, account_id, occurred_at
FROM orders;

-- Q 3
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

-- Q4a
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;
-- Q4b
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;
-- Q4c
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;


-- Q5a
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;
-- Q5b
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;


-- 6a
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;
-- 6b
SELECT *
FROM orders
WHERE gloss_amt_usd < 1000
LIMIT 10;


-- 7 :: WHERE with Non-Numeric
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- 8a :: Arithmetic Operators
SELECT standard_amt_usd/standard_qty AS unit_price_per_order, id, account_id
FROM orders
LIMIT 10;
-- 8b :: Arithmetic Operators
SELECT (poster_amt_usd/(standard_amt_usd+gloss_amt_usd+poster_amt_usd))*100 AS perc_poster, id, account_id
FROM orders
LIMIT 10;


-- 9 :: Introduction to Logical Operators
/*
LIKE :: This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
IN :: This allows you to perform operations similar to using WHERE and =, but for more than one condition.
NOT :: This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
AND & BETWEEN :: These allow you to combine operations where all combined conditions must be true.
OR :: This allows you to combine operations where at least one of the combined conditions must be true.
*/
