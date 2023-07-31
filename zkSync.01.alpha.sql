-- Preliminary code (non functional)
-- for use on dune.com, v2
WITH user_list (addr, name) AS (  
    values 
    ('0x311a9bd7cb71703ac83b0620bb0c0fa1545cebcf', 'Rank-18'),
    ('0x34fa1d4f1dfe19d8178f5cff9f84a2b5bd655110', 'Rank-12'),
    ('0x57d3d3b0bca3d3bd6b5754db72cc185e9f7eebbc', 'Rank-9'),
    ('0xf242e0cd55b378e5082a6306cc9d5d958cbe366b', 'Rank-16')
), 

ua AS (    -- 'ua' = User addresses 
    SELECT *
    FROM layerzero.send l
    RIGHT JOIN user_list
    ON l.user_address = user_list.addr    
    WHERE row(l.user_address) IN (SELECT user_list.addr FROM user_list)
)

SELECT *
FROM ua
group by name, addr
--ORDER BY name ASC
--ORDER BY Jul23 ASC, ID ASC
