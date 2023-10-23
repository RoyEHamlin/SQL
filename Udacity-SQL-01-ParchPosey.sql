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


