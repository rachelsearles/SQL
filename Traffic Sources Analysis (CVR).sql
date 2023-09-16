/* The following is code I've written to analyze the effectiveness of marketing campaigns on website traffic. The second query is where I produced a conversion rate (sessions to orders)
to determine campaign impact on sales. Conversion rate was below 4%, the company was able to save money on marketing based on this analysis */

SELECT * FROM website_sessions;
SELECT utm_source,
		utm_campaign,
        http_referer,
		COUNT(DISTINCT website_session_id) as website_sessions
FROM website_sessions
WHERE created_at < '2012-04-12'
GROUP BY utm_source,
		utm_campaign,
        http_referer
ORDER BY website_sessions DESC;

SELECT 
COUNT(DISTINCT orders.order_id) as orders,
COUNT(DISTINCT website_sessions.website_session_id) as sessions,
COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) as sess_to_order_cnv_rate
FROM website_sessions 
LEFT JOIN orders ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2012-04-14'
AND utm_source = 'gsearch'
AND utm_campaign = 'nonbrand';

-- BID OPTIMIZATION
--The following queries show a bid optimization analysis on website traffic. I use converstion rates by session and device type. 
-- I also use the COUNT CASE method to show trending over time.

SELECT 
 MIN(DATE(created_at)) as week_started_at,
COUNT(DISTINCT website_session_id) as sessions
FROM website_sessions
WHERE created_at < '2012-05-10'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY 
YEAR(created_at),
WEEK(created_at);
-- this query reveals the count of sessions each week the gsearch nonbrand marketing campaign is producing. 

SELECT
website_sessions.device_type,
COUNT(DISTINCT orders.order_id) as orders,
COUNT(DISTINCT website_sessions.website_session_id) as sessions,
COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) as sess_to_order_cnv_rate
FROM website_sessions 
LEFT JOIN orders ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2012-05-11'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY website_sessions.device_type;
/*the above query results show that mobile has a much lower CVR (less than 1%)
while desktop sessions have a 3.7% CVR*/ 

-- In the query below I use COUNT CASE to show session trend analysis by week

SELECT 
 MIN(DATE(created_at)) as week_started_at,
 COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN website_session_id ELSE NULL END) AS dtop_sessions,
 COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_session_id ELSE NULL END) AS mob_sessions
FROM website_sessions
WHERE created_at < '2012-06-09'
	AND created_at > '2012-04-15'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY 
YEAR(created_at),
WEEK(created_at);
-- results showed weekly trends on volume of desktop and mobile sessions
-- desktop sessions trend up, while mobile sessions trend down.
-- this analysis is on a granular level.

