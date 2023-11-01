
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


/*====================== Join ==========================*/
SELECT orders.*,
	   accounts.*
FROM demo.orders
JOIN demo.accounts
	ON orders.account_id = accounts.id;

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- 1a :: Join
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
-- 1b :: Join
SELECT orders.standard_qty, orders.gloss_qty, 
          orders.poster_qty,  accounts.website, 
          accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

----------------------------------------------
SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id;


--------- Alias
SELECT col1 + col2 AS total, col3  -- SELECT col1 + col2 total, col3
FROM tablename AS t1 	--	FROM tablename t1
JOIN tablename2 AS t2 	--	JOIN tablename2 t2
----------
Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2

-- Quiz: JOIN Questions Part I
Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
-- #1
	/*Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.*/
	SELECT a.primary_poc, w.channel, w.occurred_at, a.name
	FROM accounts a
	JOIN web_events w
	ON a.id = w.account_id
	WHERE name = 'Walmart'
    --ORDER BY w.occurred_at;

	SELECT a.primary_poc, w.occurred_at, w.channel, a.name
	FROM web_events w
	JOIN accounts a
	ON w.account_id = a.id
	WHERE a.name = 'Walmart';
	--ORDER BY w.occurred_at;

-- #2
	/*Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.*/
	SELECT r.name region, s.name rep, a.name account
	FROM sales_reps s
	JOIN region r
	ON s.region_id = r.id
	JOIN accounts a
	ON a.sales_rep_id = s.id
	ORDER BY a.name;

-- #3
	/*Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.*/
	SELECT r.name region, a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
	FROM region r
	JOIN sales_reps s
	ON s.region_id = r.id
	JOIN accounts a
	ON a.sales_rep_id = s.id
	JOIN orders o
	ON o.account_id = a.id;

---------- Motivation for Other JOINs

--
