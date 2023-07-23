-- Query located at https://dune.com/queries/2674446
WITH user_list (addr, name) AS (  
    values 
	('0xe93685f3bba03016f02bd1828badd6195988d950', 'Rank37'),
	('0x9681319f4e60dd165ca2432f30d91bb4dcfdfaa2', 'Rank36'),
	('0x33a3b722d84a6172170a0a60cab6d9a9cf726df2', 'Rank10'),
	('0xb809aeff162300e46f1c90c82a45452010000000', 'Rank4'),
	('0xbdcbd3a56feaf6d4b229d5dc04841f1000000009', 'Rank8')
),


ua AS (    -- 'ua' = User addresses 
    SELECT *
    FROM layerzero.send l
    RIGHT JOIN user_list
    ON l.user_address = user_list.addr    
    WHERE row(l.user_address) IN (SELECT user_list.addr FROM user_list)
)


-- Monthly values broken down as 
--      distinct tx with month / 
--      distinct days w/i month / 
--      distinct chains bridged FROM within month / 
--      total value within month

SELECT 
    name AS "ID",
    user_address AS tx_user,
    
    -- NOTE :: Months prior to Nov 2022 may be added by adding a comparison for "10" = October and earlier.
    -- Nov 2022
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 11 AND YEAR(block_time) = 2022) THEN 1 ELSE NULL END),  -- "tx/mo
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 11 AND YEAR(block_time) = 2022) THEN DAY(block_time) ELSE NULL END), -- distinct_dys/mo
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 11 AND YEAR(block_time) = 2022) THEN source_chain_name ELSE NULL END),  -- chains_from/mo
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 11 AND YEAR(block_time) = 2022) THEN amount_usd ELSE 0 END)  -- total_$$$/mo"
        ) as Nov22,    

    -- Dec 2022
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 12 AND YEAR(block_time) = 2022) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 12 AND YEAR(block_time) = 2022) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 12 AND YEAR(block_time) = 2022) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 12 AND YEAR(block_time) = 2022) THEN amount_usd ELSE 0 END)
        ) as Dec22,

    -- Jan 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 1 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 1 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 1 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 1 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as Jan23, 

    -- Feb 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 2 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 2 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 2 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 2 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as Feb23, 

    -- March 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 3 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 3 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 3 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 3 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as Mar23,    

    -- April 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 4 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 4 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 4 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 4 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as Apr23, 

    -- May 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 5 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 5 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 5 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 5 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as May23, 

    -- June 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 6 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 6 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 6 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 6 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as Jun23, 

    -- July 2023
    format('%s %s %s %s %s %s %,.0f', 
            COUNT(ALL CASE WHEN (MONTH(block_time) = 7 AND YEAR(block_time) = 2023) THEN 1 ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 7 AND YEAR(block_time) = 2023) THEN DAY(block_time) ELSE NULL END),
            '/', COUNT(DISTINCT CASE WHEN (MONTH(block_time) = 7 AND YEAR(block_time) = 2023) THEN source_chain_name ELSE NULL END),
            '/$', SUM(ALL CASE WHEN (MONTH(block_time) = 7 AND YEAR(block_time) = 2023) THEN amount_usd ELSE 0 END)
        ) as Jul23,

    -- Totals
    COUNT(*) AS Total_tx,
    COUNT(DISTINCT DAY(block_time)) AS Dist_Days,
    format('%s%,.0f', '$', SUM(amount_usd)) AS Total_USD

FROM ua
group by name, user_address
ORDER BY name ASC
