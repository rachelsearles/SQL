/* Linkedin Learning Intermediate Course using CTEs and Window Functions*/

WITH monthly_revs as (
    SELECT
        date_trunc('month', s.orderdate) as ordermonth,
        p.productname,
        SUM(s.revenue) as revenue
    FROM Products p
    JOIN Subscriptions s
        on p.ProductID = s.ProductID
    WHERE 
        OrderDate Between '2022-01-01' and '2022-12-31'
    GROUP BY 
        date_trunc('month', s.orderdate),
        p.productname)

SELECT 
    productname,
    MIN(revenue) as min_rev,
    MAX(revenue) as max_rev,
    AVG(revenue) as avg_rev,
    stddev(revenue) as std_dev_rev
FROM monthly_revs
GROUP BY productname;
