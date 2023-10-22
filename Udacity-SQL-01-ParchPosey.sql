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
