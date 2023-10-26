
-- 12a. :: AND and BETWEEN
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;
-- 12b. :: AND and BETWEEN
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';
-- 12c. :: AND and BETWEEN
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29
ORDER BY gloss_qty;
	-- Yes, BETWEEN is inclusive
-- 12c. :: AND and BETWEEN
SELECT *
FROM web_events
WHERE (channel = 'organic' OR channel = 'adwords') AND
	occurred_at >= '2016-01-01'
ORDER BY occurred_at DESC;
	-- alt
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

-- 13a. :: OR
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
-- 13b. :: OR
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
-- 13c. :: OR
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
              AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
              AND primary_poc NOT LIKE '%eana%');

