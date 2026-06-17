--- Query 1.1: Select all customers from USA ---
SELECT customer_id, customer_name, email, country
FROM customers
WHERE country = 'USA'
ORDER BY customer_name ASC;

--- Query 1.2: Select customers with high estimated income ---
SELECT customer_id, customer_name, estimated_income, acquisition_channel
FROM customers
WHERE estimated_income = '100-150k' OR estimated_income = '150k+'
ORDER BY customer_id;
 
--- Query 1.3: Count customers by age group ---
SELECT DISTINCT age_group
FROM customers
ORDER BY age_group;

--- Query 1.4: Find customers acquired through organic channel ---
SELECT customer_id, customer_name, acquisition_channel, signup_date
FROM customers
WHERE acquisition_channel = 'Organic'
ORDER BY signup_date DESC;

--- Query 1.5: Get all active subscriptions  ---
SELECT subscription_id, customer_id, subscription_type, status, monthly_price
FROM subscriptions
WHERE status = 'ACTIVE'
ORDER BY monthly_price DESC;

--- Query 1.6: Find subscriptions with high lifetime value ----
SELECT subscription_id, customer_id, subscription_type, lifetime_value_usd
FROM subscriptions
WHERE lifetime_value_usd > 100
ORDER BY lifetime_value_usd DESC;

--- Query 1.7: Select churned subscriptions with reasons ----
SELECT subscription_id, customer_id, subscription_type, churn_reason, end_date
FROM subscriptions
WHERE status = 'CHURNED'
ORDER BY end_date DESC;

---- Query 1.8: Find support tickets with negative sentiment ----
SELECT ticket_id, customer_id, ticket_date, customer_sentiment, satisfaction_score
FROM support_tickets
WHERE customer_sentiment = 'Negative'
ORDER BY satisfaction_score ASC;

--- Query 1.9: Get all Free Trial subscriptions ----
SELECT subscription_id, customer_id, subscription_type, start_date, end_date
FROM subscriptions
WHERE subscription_type = 'Free_Trial'
ORDER BY start_date DESC;

--- Query 1.10: Find customers in specific countries ----
SELECT customer_id, customer_name, country, signup_date
FROM customers
WHERE country IN ('USA', 'UK', 'India')
ORDER BY country, customer_name;

--- Query 1.11: Select usage records from specific month ---
SELECT usage_id, customer_id, subscription_id, year_month, total_hours_watched
FROM usage_metrics
WHERE year_month = '2023-01'
ORDER BY total_hours_watched DESC;
 
--- Query 1.12: Get customers not in India ----
SELECT customer_id, customer_name, country
FROM customers
WHERE country NOT IN ('India')
ORDER BY country;

--- Query 1.13: Find support tickets with long resolution time ----
SELECT ticket_id, customer_id, resolution_time_hours, status
FROM support_tickets
WHERE resolution_time_hours > 48
ORDER BY resolution_time_hours DESC;

--- Query 1.14: Select all distinct subscription types
SELECT DISTINCT subscription_type
FROM subscriptions
ORDER BY subscription_type;

--- Query 1.15: Get customers with device type = Mobile ---
SELECT customer_id, customer_name, device_type, operating_system
FROM customers
WHERE device_type = 'Mobile'
ORDER BY customer_id;

--- Query 2.1: Find customers with names containing "John" ---
SELECT customer_id, customer_name, signup_date
FROM customers
WHERE customer_name LIKE '%John%'
ORDER BY customer_name;

--- Query 2.2: Find emails from specific domains ----
SELECT customer_id, email
FROM customers
WHERE email LIKE '%@gmail.com'
ORDER BY customer_id;

--- Query 2.3: Find subscriptions with prices between $15-$25 ----
SELECT subscription_id, subscription_type, monthly_price
FROM subscriptions
WHERE monthly_price BETWEEN 15 AND 25
ORDER BY monthly_price;

--- Query 2.4: Find customers signed up in 2023 ----
SELECT customer_id, customer_name, signup_date
FROM customers
WHERE TRUNC(signup_date) BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') 
                             AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
ORDER BY signup_date;

--- Query 2.5: Find subscriptions of multiple types ---
SELECT subscription_id, customer_id, subscription_type, monthly_price
FROM subscriptions
WHERE subscription_type IN ('Premium', 'Family', 'Pro')
ORDER BY monthly_price DESC;

---- Query 2.6: Find customers NOT from USA, UK, Canada ----
SELECT customer_id, customer_name, country
FROM customers
WHERE country NOT IN ('USA', 'UK', 'Canada')
ORDER BY country;

--- Query 2.7: Find support tickets in multiple categories ----
SELECT ticket_id, customer_id, category, priority
FROM support_tickets
WHERE category IN ('Technical_Issue', 'Billing', 'Account')
ORDER BY category;

--- Query 2.8: Find usage records with hours between 10-50 ----
SELECT usage_id, customer_id, year_month, total_hours_watched
FROM usage_metrics
WHERE total_hours_watched BETWEEN 10 AND 50
ORDER BY total_hours_watched DESC;

--- Query 2.9: Find customer names starting with specific letters -----
SELECT customer_id, customer_name
FROM customers
WHERE customer_name LIKE 'A%' OR customer_name LIKE 'B%' OR customer_name LIKE 'C%'
ORDER BY customer_name;

---- Query 2.10: Find subscriptions with lifetime value between $50-$150 ----
SELECT subscription_id, customer_id, subscription_type, lifetime_value_usd
FROM subscriptions
WHERE lifetime_value_usd BETWEEN 50 AND 150
ORDER BY lifetime_value_usd DESC;

---- Query 2.11: Find tickets with satisfaction score NOT in (4,5) ----
SELECT ticket_id, customer_id, satisfaction_score, customer_sentiment
FROM support_tickets
WHERE satisfaction_score NOT IN (4, 5)
ORDER BY satisfaction_score;

---- Query 2.12: Find customers with income starting with specific pattern ----
SELECT customer_id, customer_name, estimated_income
FROM customers
WHERE estimated_income LIKE '%k%'
ORDER BY customer_id;

---- Query 2.13: Find usage records from multiple months -----
SELECT usage_id, customer_id, year_month, total_hours_watched
FROM usage_metrics
WHERE year_month IN ('2023-01', '2023-06', '2023-12', '2024-01')
ORDER BY year_month, total_hours_watched DESC;

--- Query 2.14: Find subscriptions with churn reasons NOT NULL  -----
SELECT subscription_id, customer_id, churn_reason, end_date
FROM subscriptions
WHERE churn_reason IS NOT NULL
ORDER BY end_date DESC;

---- Query 2.15: Find customers from cities containing specific text ----
SELECT customer_id, customer_name, city
FROM customers
WHERE city LIKE '%New%'
ORDER BY city;

--- Query 2.16: Find support tickets created in date range ----
SELECT ticket_id, customer_id, ticket_date
FROM support_tickets
WHERE ticket_date BETWEEN TO_DATE('2023-06-01', 'YYYY-MM-DD') 
                      AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
ORDER BY ticket_date;

--- Query 2.17: Find subscriptions NOT in specific types ----
SELECT subscription_id, subscription_type, monthly_price
FROM subscriptions
WHERE subscription_type NOT IN ('Free_Trial')
ORDER BY subscription_type;

--- Query 2.18: Find customers with employment status containing "Self" ----
SELECT customer_id, customer_name, employment_status
FROM customers
WHERE employment_status LIKE '%Self%'
ORDER BY customer_id;

--- Query 3.1: Total customers and average lifetime value ----
SELECT 
    COUNT(DISTINCT customer_id) as total_customers,
    ROUND(AVG(lifetime_value_usd), 2) as avg_ltv,
    SUM(lifetime_value_usd) as total_revenue
FROM subscriptions;

--- Query 3.2: Count active vs churned subscriptions ---
SELECT 
    status,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM subscriptions
GROUP BY status;

--- Query 3.3: Min and max subscription prices ----
SELECT 
    MIN(monthly_price) as min_price,
    MAX(monthly_price) as max_price,
    ROUND(AVG(monthly_price), 2) as avg_price,
    ROUND(STDDEV(monthly_price), 2) as std_deviation
FROM subscriptions;

--- Query 3.4: Total revenue by subscription type ---
SELECT 
    subscription_type,
    SUM(lifetime_value_usd) as total_revenue,
    COUNT(*) as subscription_count,
    ROUND(AVG(lifetime_value_usd), 2) as avg_revenue
FROM subscriptions
GROUP BY subscription_type
ORDER BY total_revenue DESC;

---- Query 3.5: Average satisfaction score by support category ----
SELECT 
    category,
    ROUND(AVG(satisfaction_score), 2) as avg_satisfaction,
    COUNT(*) as ticket_count,
    MIN(satisfaction_score) as min_score,
    MAX(satisfaction_score) as max_score
FROM support_tickets
GROUP BY category
ORDER BY avg_satisfaction DESC;

--- Query 3.6: Total hours watched by year-month ----
SELECT 
    year_month,
    SUM(total_hours_watched) as total_hours,
    COUNT(DISTINCT customer_id) as active_customers,
    ROUND(AVG(total_hours_watched), 2) as avg_hours_per_customer
FROM usage_metrics
GROUP BY year_month
ORDER BY year_month;

--- Query 3.7: Customer count and average signup by country ---
SELECT 
    country,
    COUNT(DISTINCT customer_id) as customer_count,
    MIN(signup_date) as first_signup,
    MAX(signup_date) as latest_signup,
    ROUND((MAX(signup_date) - MIN(signup_date)), 0) as days_span
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

--- Query 3.8: Revenue at risk (churned subscriptions total) ----
SELECT 
    SUM(monthly_price) as monthly_revenue_at_risk,
    SUM(lifetime_value_usd) as total_revenue_lost,
    ROUND(SUM(monthly_price) * 12, 2) as annual_revenue_lost,
    COUNT(*) as churned_count
FROM subscriptions
WHERE status = 'CHURNED';

--- Query 3.9: Average engagement score by subscription type ----
SELECT 
    subscription_type,
    ROUND(AVG(engagement_score), 2) as avg_engagement,
    ROUND(MIN(engagement_score), 2) as min_engagement,
    ROUND(MAX(engagement_score), 2) as max_engagement,
    COUNT(DISTINCT customer_id) as customers
FROM usage_metrics u
JOIN subscriptions s ON u.subscription_id = s.subscription_id
GROUP BY subscription_type
ORDER BY avg_engagement DESC;

---- Query 3.10: Total support tickets by sentiment ----
SELECT 
    customer_sentiment,
    COUNT(*) as ticket_count,
    ROUND(AVG(satisfaction_score), 2) as avg_satisfaction,
    ROUND(AVG(resolution_time_hours), 2) as avg_resolution_time
FROM support_tickets
GROUP BY customer_sentiment
ORDER BY ticket_count DESC;

---- Query 3.11: Count and sum by acquisition channel -----
SELECT 
    acquisition_channel,
    COUNT(DISTINCT customer_id) as customers,
    ROUND(SUM(lifetime_value_usd), 2) as total_ltv,
    ROUND(AVG(lifetime_value_usd), 2) as avg_ltv
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY acquisition_channel
ORDER BY total_ltv DESC;

---- Query 3.12: Statistics on sessions by month ----
SELECT 
    year_month,
    SUM(num_sessions) as total_sessions,
    ROUND(AVG(num_sessions), 2) as avg_sessions_per_customer,
    MIN(num_sessions) as min_sessions,
    MAX(num_sessions) as max_sessions
FROM usage_metrics
GROUP BY year_month
ORDER BY year_month;

---- Query 3.13: Count customers by employment status ----
SELECT 
    employment_status,
    COUNT(*) as customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM customers
GROUP BY employment_status
ORDER BY customer_count DESC;

--- Query 3.14: Average monthly price and count by customer tier ----
SELECT 
    customer_tier,
    COUNT(DISTINCT customer_id) as customers,
    ROUND(AVG(monthly_price), 2) as avg_price,
    SUM(lifetime_value_usd) as total_revenue
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY customer_tier
ORDER BY total_revenue DESC;

---- Query 3.15: Ticket resolution statistics ----
SELECT 
    ticket_channel,
    COUNT(*) as total_tickets,
    ROUND(AVG(resolution_time_hours), 2) as avg_resolution_hours,
    ROUND(AVG(first_response_time_min), 2) as avg_first_response_min,
    COUNT(CASE WHEN resolution_time_hours IS NULL THEN 1 END) as unresolved
FROM support_tickets
GROUP BY ticket_channel
ORDER BY total_tickets DESC;

---- Query 3.16: Revenue statistics by plan and status ----
SELECT 
    subscription_type,
    status,
    COUNT(*) as count,
    ROUND(SUM(lifetime_value_usd), 2) as total_revenue,
    ROUND(AVG(lifetime_value_usd), 2) as avg_revenue,
    ROUND(SUM(monthly_price), 2) as monthly_revenue
FROM subscriptions
GROUP BY subscription_type, status
ORDER BY subscription_type, status;

--- Query 3.17: Content consumption statistics ----
SELECT 
    year_month,
    SUM(content_type_movies) as movies_watched,
    SUM(content_type_series) as series_watched,
    ROUND(AVG(avg_session_length_min), 2) as avg_session_length,
    COUNT(DISTINCT customer_id) as active_watchers
FROM usage_metrics
GROUP BY year_month
ORDER BY year_month;

--- Query 3.18: Device and OS statistics ---
SELECT 
    device_type,
    COUNT(*) as customer_count,
    COUNT(DISTINCT operating_system) as os_types,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM customers
GROUP BY device_type
ORDER BY customer_count DESC;

---- Query 3.19: Summary statistics for key metrics ----
SELECT 
    'Subscriptions' as metric,
    COUNT(*) as total_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM subscriptions), 2) as pct
FROM subscriptions
WHERE status = 'ACTIVE'
UNION ALL
SELECT 'Customers', COUNT(*), 100.0
FROM customers
UNION ALL
SELECT 'Support Tickets', COUNT(*), 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM support_tickets), 2)
FROM support_tickets
WHERE customer_sentiment = 'Negative';

---- Query 3.20: Engagement statistics by satisfaction level ----
SELECT 
    CASE WHEN satisfaction_score >= 4 THEN 'Satisfied'
         WHEN satisfaction_score >= 3 THEN 'Neutral'
         ELSE 'Dissatisfied'
    END as satisfaction_level,
    COUNT(*) as ticket_count,
    ROUND(AVG(resolution_time_hours), 2) as avg_resolution_time,
    ROUND(AVG(agent_rating), 2) as avg_agent_rating
FROM support_tickets
GROUP BY CASE WHEN satisfaction_score >= 4 THEN 'Satisfied'
             WHEN satisfaction_score >= 3 THEN 'Neutral'
             ELSE 'Dissatisfied'
        END
ORDER BY satisfaction_score DESC;

--- Query 4.1: Plans with more than 10,000 subscriptions ----
SELECT 
    subscription_type,
    COUNT(*) as subscription_count,
    ROUND(AVG(monthly_price), 2) as avg_price,
    SUM(lifetime_value_usd) as total_revenue
FROM subscriptions
GROUP BY subscription_type
HAVING COUNT(*) > 10000
ORDER BY subscription_count DESC;

--- Query 4.2: Customers with multiple subscriptions ----
SELECT 
    customer_id,
    COUNT(DISTINCT subscription_id) as subscription_count,
    ROUND(SUM(lifetime_value_usd), 2) as total_ltv
FROM subscriptions
GROUP BY customer_id
HAVING COUNT(DISTINCT subscription_id) > 1
ORDER BY subscription_count DESC;

---- Query 4.3: Churn rates above 10% -----
SELECT 
    subscription_type,
    COUNT(*) as total,
    SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
    ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate
FROM subscriptions
GROUP BY subscription_type
HAVING ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) > 10
ORDER BY churn_rate DESC;

--- Query 4.4: Countries with average churn above 15% ----
SELECT 
    c.country,
    COUNT(s.subscription_id) as total_subs,
    SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
    ROUND(
        (SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.subscription_id)), 2
    ) as churn_rate
FROM subscriptions s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.country
HAVING ROUND(
    (SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.subscription_id)), 2
) > 15
ORDER BY churn_rate DESC;

--- Query 4.5: Support categories with avg resolution > 48 hours
SELECT 
    category,
    COUNT(*) as ticket_count,
    ROUND(AVG(resolution_time_hours), 2) as avg_resolution_hours,
    ROUND(AVG(satisfaction_score), 2) as avg_satisfaction
FROM support_tickets
GROUP BY category
HAVING AVG(resolution_time_hours) > 48
ORDER BY avg_resolution_hours DESC;

--- Query 4.6: Months with total hours watched > 100,000
SELECT 
    year_month,
    SUM(total_hours_watched) as total_hours,
    COUNT(DISTINCT customer_id) as active_customers,
    ROUND(SUM(total_hours_watched) / COUNT(DISTINCT customer_id), 2) as avg_hours_per_customer
FROM usage_metrics
GROUP BY year_month
HAVING SUM(total_hours_watched) > 100000
ORDER BY total_hours DESC;

--- Query 4.7: Acquisition channels with > 20,000 customers ----
SELECT 
    acquisition_channel,
    COUNT(DISTINCT customer_id) as customers,
    ROUND(AVG(lifetime_value_usd), 2) as avg_ltv,
    SUM(lifetime_value_usd) as total_revenue
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY acquisition_channel
HAVING COUNT(DISTINCT customer_id) > 20000
ORDER BY customers DESC;

--- Query 4.8: Subscription types with avg satisfaction < 3.5 ----
SELECT 
    s.subscription_type,
    ROUND(AVG(st.satisfaction_score), 2) as avg_satisfaction,
    COUNT(DISTINCT st.ticket_id) as total_tickets,
    COUNT(DISTINCT st.customer_id) as affected_customers
FROM support_tickets st
JOIN subscriptions s ON st.customer_id = s.customer_id
GROUP BY s.subscription_type
HAVING AVG(st.satisfaction_score) < 3.5
ORDER BY avg_satisfaction;

--- Query 4.9: Customer segments with total LTV > $500,000 ----
SELECT 
    CASE 
        WHEN ROUND(AVG(u.engagement_score), 0) >= 75 THEN 'High_Engagement'
        WHEN ROUND(AVG(u.engagement_score), 0) >= 50 THEN 'Medium_Engagement'
        ELSE 'Low_Engagement'
    END as engagement_segment,
    COUNT(DISTINCT c.customer_id) as customers,
    ROUND(SUM(s.lifetime_value_usd), 2) as total_ltv,
    ROUND(AVG(s.monthly_price), 2) as avg_monthly_price
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
GROUP BY CASE 
    WHEN ROUND(AVG(u.engagement_score), 0) >= 75 THEN 'High_Engagement'
    WHEN ROUND(AVG(u.engagement_score), 0) >= 50 THEN 'Medium_Engagement'
    ELSE 'Low_Engagement'
END
HAVING SUM(s.lifetime_value_usd) > 500000
ORDER BY total_ltv DESC;

---- Query 4.10: Income brackets with churn > 20% ----
SELECT 
    estimated_income,
    COUNT(DISTINCT s.subscription_id) as total_subs,
    SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
    ROUND(
        (SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / 
         COUNT(DISTINCT s.subscription_id)), 2
    ) as churn_rate
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY estimated_income
HAVING ROUND(
    (SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / 
     COUNT(DISTINCT s.subscription_id)), 2
) > 20
ORDER BY churn_rate DESC;

--- Query 4.11: Age groups with avg ticket resolution > 60 hours ----
SELECT 
    c.age_group,
    COUNT(st.ticket_id) as total_tickets,
    ROUND(AVG(st.resolution_time_hours), 2) as avg_resolution_hours,
    ROUND(AVG(st.satisfaction_score), 2) as avg_satisfaction,
    COUNT(DISTINCT st.customer_id) as affected_customers
FROM support_tickets st
JOIN customers c ON st.customer_id = c.customer_id
GROUP BY c.age_group
HAVING AVG(st.resolution_time_hours) > 60
ORDER BY avg_resolution_hours DESC;

--- Query 4.12: Months with engagement drop > 50% ----
SELECT 
    u1.year_month as current_month,
    u2.year_month as previous_month,
    ROUND(AVG(u1.engagement_score), 2) as current_engagement,
    ROUND(AVG(u2.engagement_score), 2) as previous_engagement,
    ROUND((AVG(u2.engagement_score) - AVG(u1.engagement_score)) / AVG(u2.engagement_score) * 100, 2) as drop_percentage
FROM usage_metrics u1
JOIN usage_metrics u2 ON u1.customer_id = u2.customer_id 
    AND u1.year_month > u2.year_month
GROUP BY u1.year_month, u2.year_month
HAVING ROUND((AVG(u2.engagement_score) - AVG(u1.engagement_score)) / AVG(u2.engagement_score) * 100, 2) > 50
ORDER BY drop_percentage DESC;

--- Query 4.13: Gender groups with > 15% churn ----
SELECT 
    c.gender,
    COUNT(s.subscription_id) as total_subs,
    SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
    ROUND(
        (SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / 
         COUNT(s.subscription_id)), 2
    ) as churn_rate
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.gender
HAVING ROUND(
    (SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / 
     COUNT(s.subscription_id)), 2
) > 15
ORDER BY churn_rate DESC;

--- Query 4.14: Operating systems with avg hours < 10 ----
SELECT 
    c.operating_system,
    COUNT(DISTINCT c.customer_id) as customers,
    ROUND(AVG(u.total_hours_watched), 2) as avg_hours_watched,
    COUNT(DISTINCT u.year_month) as months_tracked
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
GROUP BY c.operating_system
HAVING AVG(u.total_hours_watched) < 10
ORDER BY avg_hours_watched;

--- Query 4.15: Device types with > 50% negative sentiment ---
SELECT 
    c.device_type,
    COUNT(st.ticket_id) as total_tickets,
    SUM(CASE WHEN st.customer_sentiment = 'Negative' THEN 1 ELSE 0 END) as negative_tickets,
    ROUND(
        (SUM(CASE WHEN st.customer_sentiment = 'Negative' THEN 1 ELSE 0 END) * 100.0 / 
         COUNT(st.ticket_id)), 2
    ) as negative_percentage
FROM customers c
JOIN support_tickets st ON c.customer_id = st.customer_id
GROUP BY c.device_type
HAVING ROUND(
    (SUM(CASE WHEN st.customer_sentiment = 'Negative' THEN 1 ELSE 0 END) * 100.0 / 
     COUNT(st.ticket_id)), 2
) > 50
ORDER BY negative_percentage DESC;

--- Query 4.16: Channels with avg satisfaction < 3
SELECT 
    ticket_channel,
    COUNT(*) as tickets,
    ROUND(AVG(satisfaction_score), 2) as avg_satisfaction,
    SUM(CASE WHEN customer_sentiment = 'Negative' THEN 1 ELSE 0 END) as negative_count
FROM support_tickets
GROUP BY ticket_channel
HAVING AVG(satisfaction_score) < 3
ORDER BY avg_satisfaction;

--- Query 4.17: Subscription prices with revenue > $1M ---
SELECT 
    monthly_price,
    COUNT(*) as subscription_count,
    ROUND(SUM(lifetime_value_usd), 2) as total_revenue,
    ROUND(AVG(lifetime_value_usd), 2) as avg_ltv
FROM subscriptions
GROUP BY monthly_price
HAVING SUM(lifetime_value_usd) > 1000000
ORDER BY total_revenue DESC;

--- Query 4.18: Priority levels with unresolved > 10% ----
SELECT 
    priority,
    COUNT(*) as total_tickets,
    COUNT(CASE WHEN status != 'Resolved' THEN 1 END) as unresolved,
    ROUND(
        (COUNT(CASE WHEN status != 'Resolved' THEN 1 END) * 100.0 / COUNT(*)), 2
    ) as unresolved_percentage
FROM support_tickets
GROUP BY priority
HAVING ROUND(
    (COUNT(CASE WHEN status != 'Resolved' THEN 1 END) * 100.0 / COUNT(*)), 2
) > 10
ORDER BY unresolved_percentage DESC;

---- Query 5.1: INNER JOIN - Customers with subscriptions  ----
SELECT 
    c.customer_id,
    c.customer_name,
    c.country,
    s.subscription_id,
    s.subscription_type,
    s.monthly_price,
    s.status
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
ORDER BY c.customer_id;

--- Query 5.2: INNER JOIN - Subscriptions with usage data ---
SELECT 
    s.subscription_id,
    s.customer_id,
    s.subscription_type,
    u.year_month,
    u.total_hours_watched,
    u.engagement_score
FROM subscriptions s
INNER JOIN usage_metrics u ON s.subscription_id = u.subscription_id
ORDER BY s.subscription_id, u.year_month;

--- Query 5.3: INNER JOIN - Customers with support tickets
SELECT 
    c.customer_id,
    c.customer_name,
    c.country,
    st.ticket_id,
    st.category,
    st.customer_sentiment,
    st.satisfaction_score
FROM customers c
INNER JOIN support_tickets st ON c.customer_id = st.customer_id
ORDER BY c.customer_id, st.ticket_id;

--- Query 5.4: LEFT JOIN - All customers with their subscriptions
SELECT 
    c.customer_id,
    c.customer_name,
    c.acquisition_channel,
    s.subscription_id,
    s.subscription_type,
    s.status
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
ORDER BY c.customer_id;

--- Query 5.5: LEFT JOIN - Customers without subscriptions
SELECT 
    c.customer_id,
    c.customer_name,
    c.signup_date,
    s.subscription_id
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
WHERE s.subscription_id IS NULL
ORDER BY c.signup_date DESC;

--- Query 5.6: LEFT JOIN - Subscriptions without usage data
SELECT 
    s.subscription_id,
    s.customer_id,
    s.subscription_type,
    s.status,
    u.total_hours_watched
FROM subscriptions s
LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
WHERE u.usage_id IS NULL
ORDER BY s.subscription_id;

--- Query 5.7: INNER JOIN - Three tables (customers, subscriptions, usage)---
SELECT 
    c.customer_id,
    c.customer_name,
    c.country,
    s.subscription_type,
    u.year_month,
    u.total_hours_watched,
    u.engagement_score
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
INNER JOIN usage_metrics u ON s.subscription_id = u.subscription_id
WHERE u.total_hours_watched > 50
ORDER BY c.customer_id, u.year_month;

---- Query 5.8: INNER JOIN with aggregation - Revenue by customer and plan
SELECT 
    c.customer_id,
    c.customer_name,
    s.subscription_type,
    COUNT(DISTINCT s.subscription_id) as subscription_count,
    ROUND(SUM(s.lifetime_value_usd), 2) as total_ltv,
    ROUND(AVG(s.monthly_price), 2) as avg_monthly_price
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, s.subscription_type
ORDER BY total_ltv DESC;

--- Query 5.9: LEFT JOIN - Churn analysis with support data
SELECT 
    c.customer_id,
    c.customer_name,
    s.subscription_type,
    s.status,
    st.ticket_id,
    st.customer_sentiment,
    st.satisfaction_score
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN support_tickets st ON c.customer_id = st.customer_id
WHERE s.status = 'CHURNED'
ORDER BY c.customer_id;

--- Query 5.10: INNER JOIN - Four tables
SELECT 
    c.customer_id,
    c.customer_name,
    c.country,
    s.subscription_type,
    u.total_hours_watched,
    st.customer_sentiment
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
INNER JOIN usage_metrics u ON s.subscription_id = u.subscription_id
INNER JOIN support_tickets st ON c.customer_id = st.customer_id
WHERE u.total_hours_watched = 0 AND st.customer_sentiment = 'Negative'
ORDER BY c.customer_id;

--- Query 5.11: LEFT JOIN - Find customers never contacted support
SELECT 
    c.customer_id,
    c.customer_name,
    c.signup_date,
    st.ticket_id
FROM customers c
LEFT JOIN support_tickets st ON c.customer_id = st.customer_id
WHERE st.ticket_id IS NULL
ORDER BY c.customer_id;

--- Query 5.12: INNER JOIN with GROUP BY - Churn by geography
SELECT 
    c.country,
    COUNT(s.subscription_id) as total_subs,
    SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
    ROUND(SUM(s.lifetime_value_usd), 2) as total_revenue
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;

--- Query 5.13: LEFT JOIN - Engagement analysis
SELECT 
    s.subscription_id,
    s.customer_id,
    s.subscription_type,
    ROUND(AVG(u.engagement_score), 2) as avg_engagement,
    COUNT(DISTINCT u.year_month) as months_tracked,
    s.status
FROM subscriptions s
LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
GROUP BY s.subscription_id, s.customer_id, s.subscription_type, s.status
ORDER BY avg_engagement DESC;

--- Query 5.14: INNER JOIN - Negative sentiment correlation with churn
SELECT 
    c.customer_id,
    c.customer_name,
    s.subscription_type,
    s.status,
    COUNT(DISTINCT st.ticket_id) as negative_tickets,
    ROUND(AVG(st.satisfaction_score), 2) as avg_satisfaction
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
INNER JOIN support_tickets st ON c.customer_id = st.customer_id
WHERE st.customer_sentiment = 'Negative'
GROUP BY c.customer_id, c.customer_name, s.subscription_type, s.status
ORDER BY negative_tickets DESC;

--- Query 5.15: LEFT JOIN - Customers and their last support contact
SELECT 
    c.customer_id,
    c.customer_name,
    MAX(st.ticket_date) as last_support_contact,
    st.customer_sentiment,
    st.satisfaction_score
FROM customers c
LEFT JOIN support_tickets st ON c.customer_id = st.customer_id
GROUP BY c.customer_id, c.customer_name, st.customer_sentiment, st.satisfaction_score
ORDER BY c.customer_id;

---Query 5.16: FULL OUTER JOIN simulation - Matching records
SELECT 
    c.customer_id,
    c.customer_name,
    s.subscription_id,
    s.subscription_type
FROM customers c
FULL OUTER JOIN subscriptions s ON c.customer_id = s.customer_id
ORDER BY c.customer_id;

--- Query 5.17: INNER JOIN - Content consumption by plan
`SELECT 
    s.subscription_type,
    SUM(u.content_type_movies) as total_movies,
    SUM(u.content_type_series) as total_series,
    COUNT(DISTINCT u.customer_id) as unique_watchers,
    ROUND(AVG(u.total_hours_watched), 2) as avg_hours
FROM subscriptions s
INNER JOIN usage_metrics u ON s.subscription_id = u.subscription_id
GROUP BY s.subscription_type
ORDER BY total_movies + total_series DESC;

--- Query 5.18: LEFT JOIN - Find users with zero engagement
SELECT 
    s.subscription_id,
    s.customer_id,
    s.subscription_type,
    u.engagement_score,
    u.total_hours_watched
FROM subscriptions s
LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
WHERE u.engagement_score = 0 OR u.engagement_score IS NULL
ORDER BY s.subscription_id;

--- Query 5.19: INNER JOIN - Multiple joins with WHERE clause ----
SELECT 
    c.customer_id,
    c.customer_name,
    c.country,
    s.subscription_type,
    s.status,
    st.category,
    st.customer_sentiment
FROM customers c
INNER JOIN subscriptions s ON c.customer_id = s.customer_id
INNER JOIN support_tickets st ON c.customer_id = st.customer_id
WHERE c.country = 'India' AND s.status = 'CHURNED' AND st.customer_sentiment = 'Negative'
ORDER BY c.customer_id;

--- Query 5.20: LEFT JOIN - Revenue analysis across all tables
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT s.subscription_id) as total_subscriptions,
    ROUND(SUM(s.lifetime_value_usd), 2) as total_revenue,
    COUNT(DISTINCT u.usage_id) as usage_records,
    COUNT(DISTINCT st.ticket_id) as support_tickets
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
LEFT JOIN support_tickets st ON c.customer_id = st.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;

--- Query 6.1: Scalar subquery - Average churn rate
SELECT 
    subscription_type,
    COUNT(*) as total,
    SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
    ROUND(
        (SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2
    ) as churn_rate,
    (SELECT ROUND(
        SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) FROM subscriptions) as overall_churn_rate
FROM subscriptions
GROUP BY subscription_type
ORDER BY churn_rate DESC;

---Query 6.2: Subquery in WHERE - Customers above average LTV
SELECT 
    customer_id,
    customer_name,
    (SELECT ROUND(AVG(lifetime_value_usd), 2) FROM subscriptions) as avg_ltv
FROM customers c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM subscriptions
    GROUP BY customer_id
    HAVING SUM(lifetime_value_usd) > (SELECT AVG(lifetime_value_usd) FROM subscriptions)
)
ORDER BY customer_id;

---Query 6.3: Inline view - Top churning plans
SELECT *
FROM (
    SELECT 
        subscription_type,
        COUNT(*) as total,
        SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
        ROUND(
            (SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2
        ) as churn_rate
    FROM subscriptions
    GROUP BY subscription_type
)
WHERE churn_rate > 10
ORDER BY churn_rate DESC;

--- Query 6.4: Correlated subquery - Customer details with churn status
SELECT 
    customer_id,
    customer_name,
    country,
    (SELECT COUNT(*) FROM subscriptions WHERE customer_id = c.customer_id) as total_subscriptions,
    (SELECT COUNT(*) FROM subscriptions 
     WHERE customer_id = c.customer_id AND status = 'CHURNED') as churned_subscriptions
FROM customers c
ORDER BY churned_subscriptions DESC;

--- Query 6.5: Subquery with EXISTS - Customers with support issues
SELECT 
    customer_id,
    customer_name,
    acquisition_channel
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM support_tickets
    WHERE customer_id = c.customer_id AND customer_sentiment = 'Negative'
)
ORDER BY customer_id;

--- Query 6.6: Subquery - Customers without any support tickets
SELECT 
    customer_id,
    customer_name,
    country
FROM customers c
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM support_tickets
)
ORDER BY customer_id;

--- Query 6.7: Multiple subqueries - Complex churn analysis
SELECT 
    subscription_type,
    (SELECT COUNT(*) FROM subscriptions WHERE subscription_type = s.subscription_type) as total,
    (SELECT SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) 
     FROM subscriptions WHERE subscription_type = s.subscription_type) as churned,
    (SELECT ROUND(SUM(lifetime_value_usd), 2)
     FROM subscriptions WHERE subscription_type = s.subscription_type) as total_revenue
FROM subscriptions s
GROUP BY subscription_type
ORDER BY total DESC;

--- Query 6.8: Inline view with aggregation - Customer segments
SELECT 
    customer_segment,
    COUNT(*) as customers,
    ROUND(AVG(total_ltv), 2) as avg_ltv,
    ROUND(SUM(total_ltv), 2) as segment_revenue
FROM (
    SELECT 
        customer_id,
        CASE 
            WHEN SUM(lifetime_value_usd) > 1000 THEN 'High_Value'
            WHEN SUM(lifetime_value_usd) > 500 THEN 'Medium_Value'
            ELSE 'Low_Value'
        END as customer_segment,
        SUM(lifetime_value_usd) as total_ltv
    FROM subscriptions
    GROUP BY customer_id
)
GROUP BY customer_segment
ORDER BY segment_revenue DESC;

--- Query 6.9: Subquery - Revenue at risk compared to total
SELECT 
    SUM(CASE WHEN status = 'CHURNED' THEN lifetime_value_usd ELSE 0 END) as revenue_lost,
    (SELECT SUM(lifetime_value_usd) FROM subscriptions) as total_revenue,
    ROUND(
        (SUM(CASE WHEN status = 'CHURNED' THEN lifetime_value_usd ELSE 0 END) * 100.0 / 
        (SELECT SUM(lifetime_value_usd) FROM subscriptions)), 2
    ) as pct_lost
FROM subscriptions;

--- Query 6.10: Correlated subquery - Last purchase date analysis
SELECT 
    customer_id,
    customer_name,
    (SELECT MAX(start_date) FROM subscriptions WHERE customer_id = c.customer_id) as last_purchase,
    TRUNC(SYSDATE - (SELECT MAX(start_date) FROM subscriptions WHERE customer_id = c.customer_id)) as days_since_purchase
FROM customers c
ORDER BY days_since_purchase DESC;

--- Query 6.11: Subquery with IN clause - Customers from top countries
SELECT 
    customer_id,
    customer_name,
    country
FROM customers
WHERE country IN (
    SELECT country
    FROM customers
    GROUP BY country
    HAVING COUNT(*) > 10000
)
ORDER BY customer_id;

--- Query 6.12: Nested subquery - Complex engagement analysis
SELECT 
    customer_id,
    engagement_level,
    customer_count
FROM (
    SELECT 
        customer_id,
        CASE 
            WHEN avg_engagement >= 75 THEN 'High'
            WHEN avg_engagement >= 50 THEN 'Medium'
            ELSE 'Low'
        END as engagement_level,
        COUNT(*) OVER (PARTITION BY CASE 
            WHEN avg_engagement >= 75 THEN 'High'
            WHEN avg_engagement >= 50 THEN 'Medium'
            ELSE 'Low'
        END) as customer_count
    FROM (
        SELECT 
            customer_id,
            ROUND(AVG(engagement_score), 2) as avg_engagement
        FROM usage_metrics
        GROUP BY customer_id
    )
)
ORDER BY customer_id;

--- Query 6.13: Subquery - Find outliers in satisfaction scores
SELECT 
    customer_id,
    category,
    satisfaction_score,
    (SELECT ROUND(AVG(satisfaction_score), 2) FROM support_tickets) as overall_avg
FROM support_tickets
WHERE satisfaction_score < (
    SELECT ROUND(AVG(satisfaction_score), 2) - 1
    FROM support_tickets
)
ORDER BY satisfaction_score;

--- Query 6.14: Correlated subquery - Subscription status summary
SELECT 
    c.customer_id,
    c.customer_name,
    (SELECT COUNT(*) FROM subscriptions WHERE customer_id = c.customer_id AND status = 'ACTIVE') as active_count,
    (SELECT COUNT(*) FROM subscriptions WHERE customer_id = c.customer_id AND status = 'CHURNED') as churned_count,
    (SELECT ROUND(SUM(lifetime_value_usd), 2) FROM subscriptions WHERE customer_id = c.customer_id) as total_ltv
FROM customers c
WHERE (SELECT COUNT(*) FROM subscriptions WHERE customer_id = c.customer_id) > 0
ORDER BY total_ltv DESC;

--- Query 6.15: Subquery - Find customers with above-average engagement ---
SELECT 
    customer_id,
    AVG_ENGAGEMENT,
    OVERALL_AVG,
    ENGAGEMENT_LEVEL
FROM (
    SELECT 
        u.customer_id,
        ROUND(AVG(u.engagement_score), 2) as AVG_ENGAGEMENT,
        (SELECT ROUND(AVG(engagement_score), 2) FROM usage_metrics) as OVERALL_AVG,
        CASE 
            WHEN ROUND(AVG(u.engagement_score), 2) > 
                 (SELECT ROUND(AVG(engagement_score), 2) FROM usage_metrics) 
            THEN 'Above_Average'
            ELSE 'Below_Average'
        END as ENGAGEMENT_LEVEL
    FROM usage_metrics u
    GROUP BY u.customer_id
)
WHERE ENGAGEMENT_LEVEL = 'Above_Average'
ORDER BY AVG_ENGAGEMENT DESC;

--- Query 6.16: Inline view - Churn prediction (zero usage indicator)
SELECT 
    *
FROM (
    SELECT 
        s.subscription_id,
        s.customer_id,
        s.subscription_type,
        s.status,
        COUNT(CASE WHEN u.total_hours_watched = 0 THEN 1 END) as zero_usage_months,
        COUNT(DISTINCT u.year_month) as total_months,
        CASE 
            WHEN COUNT(CASE WHEN u.total_hours_watched = 0 THEN 1 END) >= 2 THEN 'HIGH_RISK'
            WHEN COUNT(CASE WHEN u.total_hours_watched = 0 THEN 1 END) = 1 THEN 'MEDIUM_RISK'
            ELSE 'LOW_RISK'
        END as CHURN_RISK
    FROM subscriptions s
    LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
    GROUP BY s.subscription_id, s.customer_id, s.subscription_type, s.status
)
WHERE CHURN_RISK IN ('HIGH_RISK', 'MEDIUM_RISK')
ORDER BY zero_usage_months DESC;

--- Query 6.17: Subquery with UNION - Combine metrics from multiple sources
SELECT 'Total_Subscriptions' as metric, COUNT(*) as value FROM subscriptions
UNION ALL
SELECT 'Total_Customers', COUNT(DISTINCT customer_id) FROM subscriptions
UNION ALL
SELECT 'Churned_Subscriptions', COUNT(*) FROM subscriptions WHERE status = 'CHURNED'
UNION ALL
SELECT 'Active_Subscriptions', COUNT(*) FROM subscriptions WHERE status = 'ACTIVE'
UNION ALL
SELECT 'Total_Support_Tickets', COUNT(*) FROM support_tickets
UNION ALL
SELECT 'Negative_Sentiment_Tickets', COUNT(*) FROM support_tickets WHERE customer_sentiment = 'Negative'
UNION ALL
SELECT 'Usage_Records', COUNT(*) FROM usage_metrics
ORDER BY metric;

--- Query 6.18: Complex nested subquery - Customer lifetime value tiers ---
sqlSELECT 
    customer_tier,
    tier_rank,
    customer_count,
    ROUND(avg_ltv, 2) as avg_ltv,
    ROUND(total_ltv, 2) as total_ltv
FROM (
    SELECT 
        customer_tier,
        ROW_NUMBER() OVER (ORDER BY total_ltv DESC) as tier_rank,
        customer_count,
        avg_ltv,
        total_ltv
    FROM (
        SELECT 
            CASE 
                WHEN SUM(s.lifetime_value_usd) > 5000 THEN 'Platinum'
                WHEN SUM(s.lifetime_value_usd) > 2000 THEN 'Gold'
                WHEN SUM(s.lifetime_value_usd) > 500 THEN 'Silver'
                ELSE 'Bronze'
            END as customer_tier,
            COUNT(DISTINCT c.customer_id) as customer_count,
            ROUND(AVG(s.lifetime_value_usd), 2) as avg_ltv,
            ROUND(SUM(s.lifetime_value_usd), 2) as total_ltv
        FROM customers c
        LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
        GROUP BY c.customer_id
    )
    GROUP BY customer_tier, total_ltv
)
ORDER BY tier_rank;

--- Query 7.1: Days between signup and churn
sqlSELECT 
    c.customer_id,
    c.customer_name,
    c.signup_date,
    s.end_date,
    TRUNC(s.end_date - c.signup_date) as days_to_churn,
    ROUND((s.end_date - c.signup_date) / 30, 1) as months_to_churn
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
WHERE s.status = 'CHURNED'
ORDER BY days_to_churn DESC;
Query 7.2: Customer lifetime in months
sqlSELECT 
    customer_id,
    customer_name,
    signup_date,
    TRUNC(MONTHS_BETWEEN(SYSDATE, signup_date)) as months_as_customer,
    CASE 
        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, signup_date)) < 3 THEN 'New'
        WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, signup_date)) < 12 THEN 'Developing'
        ELSE 'Established'
    END as customer_stage
FROM customers
ORDER BY months_as_customer DESC;

---- Query 7.3: Extract month and year from signup date
SELECT 
    customer_id,
    customer_name,
    signup_date,
    EXTRACT(YEAR FROM signup_date) as signup_year,
    EXTRACT(MONTH FROM signup_date) as signup_month,
    TO_CHAR(signup_date, 'YYYY-MM') as signup_ym
FROM customers
ORDER BY signup_date;
Query 7.4: Subscriptions by quarter
sqlSELECT 
    TO_CHAR(start_date, 'YYYY') as year,
    TO_CHAR(start_date, 'Q') as quarter,
    COUNT(*) as subscription_count,
    ROUND(SUM(lifetime_value_usd), 2) as total_revenue
FROM subscriptions
GROUP BY TO_CHAR(start_date, 'YYYY'), TO_CHAR(start_date, 'Q')
ORDER BY TO_CHAR(start_date, 'YYYY'), TO_CHAR(start_date, 'Q');

---- Query 7.5: Days since last support contact
SELECT 
    customer_id,
    MAX(ticket_date) as last_contact,
    TRUNC(SYSDATE - MAX(ticket_date)) as days_since_contact,
    CASE 
        WHEN TRUNC(SYSDATE - MAX(ticket_date)) < 7 THEN 'Very_Recent'
        WHEN TRUNC(SYSDATE - MAX(ticket_date)) < 30 THEN 'Recent'
        WHEN TRUNC(SYSDATE - MAX(ticket_date)) < 90 THEN 'Moderate'
        ELSE 'Long_Ago'
    END as contact_recency
FROM support_tickets
GROUP BY customer_id
ORDER BY days_since_contact;

---Query 7.6: Add days to subscription start date
SELECT 
    subscription_id,
    customer_id,
    start_date,
    start_date + 7 as seven_days_after,
    start_date + 30 as thirty_days_after,
    start_date + 90 as ninety_days_after,
    status
FROM subscriptions
ORDER BY start_date DESC;

--- Query 7.7: Subscriptions created this year
SELECT 
    subscription_id,
    customer_id,
    subscription_type,
    start_date,
    end_date,
    TRUNC(SYSDATE - start_date) as days_active
FROM subscriptions
WHERE EXTRACT(YEAR FROM start_date) = EXTRACT(YEAR FROM SYSDATE)
ORDER BY start_date DESC;

---Query 7.8: Usage metrics by day of week
SELECT 
    TO_CHAR(TO_DATE(year_month || '-01', 'YYYY-MM-DD'), 'Day') as day_of_week,
    COUNT(*) as record_count,
    ROUND(AVG(total_hours_watched), 2) as avg_hours,
    ROUND(SUM(total_hours_watched), 2) as total_hours
FROM usage_metrics
GROUP BY TO_CHAR(TO_DATE(year_month || '-01', 'YYYY-MM-DD'), 'Day')
ORDER BY record_count DESC;

--- Query 7.9: Last day of month for usage data
SELECT 
    year_month,
    LAST_DAY(TO_DATE(year_month || '-01', 'YYYY-MM-DD')) as last_day,
    COUNT(*) as record_count,
    ROUND(SUM(total_hours_watched), 2) as total_hours
FROM usage_metrics
GROUP BY year_month
ORDER BY year_month;

--- Query 7.10: First day of month signup analysis
SELECT 
    TO_DATE(TO_CHAR(signup_date, 'YYYY-MM') || '-01', 'YYYY-MM-DD') as signup_month_start,
    COUNT(*) as signups,
    ROUND(AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, signup_date))), 2) as avg_months_active
FROM customers
GROUP BY TO_DATE(TO_CHAR(signup_date, 'YYYY-MM') || '-01', 'YYYY-MM-DD')
ORDER BY signup_month_start DESC;

--- Query 7.11: Duration of subscription in days
SELECT 
    subscription_id,
    customer_id,
    subscription_type,
    start_date,
    NVL(end_date, SYSDATE) as end_date,
    TRUNC(NVL(end_date, SYSDATE) - start_date) as subscription_days,
    CASE 
        WHEN TRUNC(NVL(end_date, SYSDATE) - start_date) < 30 THEN '< 1 Month'
        WHEN TRUNC(NVL(end_date, SYSDATE) - start_date) < 90 THEN '1-3 Months'
        WHEN TRUNC(NVL(end_date, SYSDATE) - start_date) < 180 THEN '3-6 Months'
        ELSE '> 6 Months'
    END as duration_bracket
FROM subscriptions
ORDER BY subscription_days DESC;

--- Query 7.12: Churn by month of year ---
SELECT 
    EXTRACT(MONTH FROM end_date) as churn_month,
    TO_CHAR(end_date, 'Month') as month_name,
    COUNT(*) as churned_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM subscriptions WHERE status = 'CHURNED'), 2) as pct_of_total_churn
FROM subscriptions
WHERE status = 'CHURNED'
GROUP BY EXTRACT(MONTH FROM end_date), TO_CHAR(end_date, 'Month')
ORDER BY churn_month;

--- Query 7.13: Add/subtract intervals
SELECT 
    subscription_id,
    customer_id,
    start_date,
    start_date + INTERVAL '1' MONTH as one_month_later,
    start_date + INTERVAL '3' MONTH as three_months_later,
    start_date - INTERVAL '1' MONTH as one_month_before
FROM subscriptions
ORDER BY start_date DESC;

---- Query 7.14: Round date to nearest month
SELECT 
    customer_id,
    TRUNC(signup_date, 'MONTH') as signup_month_first,
    ROUND(signup_date, 'MONTH') as signup_month_rounded,
    signup_date
FROM customers
ORDER BY signup_date DESC;

--- Query 7.15: Age of data in usage metrics
SELECT 
    year_month,
    TO_DATE(year_month || '-01', 'YYYY-MM-DD') as metric_date,
    TRUNC(SYSDATE - TO_DATE(year_month || '-01', 'YYYY-MM-DD')) as days_old,
    COUNT(*) as records
FROM usage_metrics
GROUP BY year_month
ORDER BY metric_date DESC;

--- Query 7.16: Support tickets by day of week
SELECT 
    TO_CHAR(ticket_date, 'Day') as day_of_week,
    COUNT(*) as ticket_count,
    ROUND(AVG(satisfaction_score), 2) as avg_satisfaction
FROM support_tickets
GROUP BY TO_CHAR(ticket_date, 'Day')
ORDER BY ticket_count DESC;

---Query 7.17: Time between events (ticket creation to resolution)
SELECT 
    ticket_id,
    customer_id,
    ticket_date,
    SYSDATE as current_date,
    TRUNC(SYSDATE - ticket_date) as days_to_resolve,
    ROUND(resolution_time_hours / 24, 1) as resolution_days
FROM support_tickets
ORDER BY days_to_resolve DESC;

--- Query 7.18: Subscriptions by season
SELECT 
    CASE 
        WHEN EXTRACT(MONTH FROM start_date) IN (12, 1, 2) THEN 'Winter'
        WHEN EXTRACT(MONTH FROM start_date) IN (3, 4, 5) THEN 'Spring'
        WHEN EXTRACT(MONTH FROM start_date) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END as season,
    COUNT(*) as subscription_count,
    ROUND(AVG(lifetime_value_usd), 2) as avg_ltv
FROM subscriptions
GROUP BY CASE 
    WHEN EXTRACT(MONTH FROM start_date) IN (12, 1, 2) THEN 'Winter'
    WHEN EXTRACT(MONTH FROM start_date) IN (3, 4, 5) THEN 'Spring'
    WHEN EXTRACT(MONTH FROM start_date) IN (6, 7, 8) THEN 'Summer'
    ELSE 'Fall'
END
ORDER BY subscription_count DESC;

--- Query 7.19: Age buckets (years as customer)
SELECT 
    customer_id,
    customer_name,
    signup_date,
    FLOOR(MONTHS_BETWEEN(SYSDATE, signup_date) / 12) as years_as_customer,
    CASE 
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, signup_date) / 12) = 0 THEN 'Year 1'
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, signup_date) / 12) = 1 THEN 'Year 2'
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, signup_date) / 12) >= 2 THEN 'Year 3+'
    END as tenure_bracket
FROM customers
ORDER BY years_as_customer DESC;

--- Query 7.20: Subscription anniversary dates
SELECT 
    subscription_id,
    customer_id,
    start_date,
    ADD_MONTHS(start_date, 1) as first_anniversary,
    ADD_MONTHS(start_date, 6) as six_month_mark,
    ADD_MONTHS(start_date, 12) as one_year_anniversary,
    status
FROM subscriptions
ORDER BY start_date DESC;

---- Query 7.21: Business days since signup
SELECT 
    customer_id,
    customer_name,
    signup_date,
    TRUNC(
        (TRUNC(SYSDATE) - TRUNC(signup_date)) - 
        (FLOOR((TRUNC(SYSDATE) - TRUNC(signup_date)) / 7) * 2)
    ) as business_days_active
FROM customers
ORDER BY business_days_active DESC;

--- Query 7.22: Date range analysis for specific quarters
SELECT 
    customer_id,
    customer_name,
    signup_date,
    CASE 
        WHEN signup_date >= TRUNC(SYSDATE, 'YYYY') 
             AND signup_date < ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 3) THEN 'Q1'
        WHEN signup_date >= ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 3) 
             AND signup_date < ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 6) THEN 'Q2'
        WHEN signup_date >= ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 6) 
             AND signup_date < ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 9) THEN 'Q3'
        ELSE 'Q4'
    END as signup_quarter
FROM customers
ORDER BY signup_date DESC;

--- Query 8.1: Extract domain from email
SELECT 
    customer_id,
    email,
    SUBSTR(email, INSTR(email, '@') + 1) as email_domain,
    COUNT(*) OVER (PARTITION BY SUBSTR(email, INSTR(email, '@') + 1)) as customers_on_domain
FROM customers
ORDER BY email_domain;

--- Query 8.2: Customer name length
SELECT 
    customer_id,
    customer_name,
    LENGTH(customer_name) as name_length,
    CASE 
        WHEN LENGTH(customer_name) < 10 THEN 'Short'
        WHEN LENGTH(customer_name) < 20 THEN 'Medium'
        ELSE 'Long'
    END as name_category
FROM customers
ORDER BY name_length DESC;

---- Query 8.3: Uppercase and lowercase conversion
SELECT 
    customer_id,
    customer_name,
    UPPER(customer_name) as name_upper,
    LOWER(customer_name) as name_lower,
    INITCAP(customer_name) as name_proper_case
FROM customers
ORDER BY customer_id;

--- Query 8.4: Substring extraction
SELECT 
    customer_id,
    email,
    SUBSTR(email, 1, INSTR(email, '@') - 1) as email_username,
    SUBSTR(email, INSTR(email, '@') + 1) as email_domain
FROM customers
ORDER BY customer_id;

--- Query 8.5: Find position of character
SELECT 
    ticket_id,
    ticket_channel,
    INSTR(ticket_channel, '_') as underscore_position,
    INSTR(UPPER(ticket_channel), 'A') as first_a_position,
    CASE 
        WHEN INSTR(ticket_channel, '_') > 0 THEN 'Contains Underscore'
        ELSE 'No Underscore'
    END as channel_format
FROM support_tickets
ORDER BY ticket_id;

--- Query 8.6: Trim whitespace
SELECT 
    customer_id,
    TRIM(customer_name) as trimmed_name,
    LTRIM(customer_name) as left_trim,
    RTRIM(customer_name) as right_trim,
    LENGTH(TRIM(customer_name)) as trimmed_length
FROM customers
WHERE customer_name LIKE ' %' OR customer_name LIKE '% '
ORDER BY customer_id;

--- Query 8.7: Replace characters
SELECT 
    customer_id,
    email,
    REPLACE(email, '.com', '[DOT]COM') as masked_email,
    REPLACE(REPLACE(email, 'a', '*'), 'e', '*') as vowel_replaced
FROM customers
ORDER BY customer_id;

--- Query 8.8: Concatenate strings
SELECT 
    customer_id,
    customer_name,
    country,
    email,
    customer_name || ' from ' || country || ' (' || email || ')' as customer_summary,
    CONCAT(CONCAT(customer_name, ' - '), country) as name_country
FROM customers
ORDER BY customer_id;

--- Query 8.9: Extract numeric value from string
SELECT 
    customer_id,
    estimated_income,
    REPLACE(REPLACE(estimated_income, 'k', '000'), '+', '') as numeric_income,
    CASE 
        WHEN estimated_income LIKE '%150k%' THEN 150000
        WHEN estimated_income LIKE '%100-150%' THEN 125000
        WHEN estimated_income LIKE '%60%' THEN 60000
        WHEN estimated_income LIKE '%30%' THEN 30000
        ELSE 0
    END as income_estimate
FROM customers
ORDER BY customer_id;

--- Query 8.10: String pattern matching
SELECT 
    customer_id,
    customer_name,
    email,
    CASE 
        WHEN email LIKE '%@gmail.com' THEN 'Gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'Yahoo'
        WHEN email LIKE '%@outlook.com' THEN 'Outlook'
        ELSE 'Other'
    END as email_provider
FROM customers
ORDER BY customer_id;

--- Query 8.11: Find and extract keywords
SELECT 
    ticket_id,
    category,
    CASE 
        WHEN category LIKE '%Technical%' THEN 'App Issue'
        WHEN category LIKE '%Billing%' THEN 'Payment Issue'
        WHEN category LIKE '%Account%' THEN 'Account Issue'
        WHEN category LIKE '%Content%' THEN 'Content Issue'
        WHEN category LIKE '%Device%' THEN 'Device Issue'
        ELSE 'Other'
    END as issue_type
FROM support_tickets
ORDER BY ticket_id;

--- Query 8.12: Count occurrences of character
SELECT 
    customer_id,
    customer_name,
    email,
    (LENGTH(email) - LENGTH(REPLACE(email, '.', ''))) as dot_count,
    (LENGTH(email) - LENGTH(REPLACE(email, '@', ''))) as at_sign_count,
    (LENGTH(email) - LENGTH(REPLACE(email, 'a', ''))) as letter_a_count
FROM customers
ORDER BY customer_id;

--- Query 8.13: Extract substring between delimiters
SELECT 
    customer_id,
    email,
    SUBSTR(email, 1, INSTR(email, '@') - 1) as username,
    SUBSTR(email, INSTR(email, '@') + 1, INSTR(email, '.') - INSTR(email, '@') - 1) as domain_name,
    SUBSTR(email, INSTR(email, '.') + 1) as tld
FROM customers
ORDER BY customer_id;

--- Query 8.14: String comparison and matching
SELECT 
    subscription_id,
    subscription_type,
    churn_reason,
    CASE 
        WHEN churn_reason LIKE '%Expensive%' THEN 1
        WHEN churn_reason LIKE '%Better%' THEN 1
        WHEN churn_reason LIKE '%Usage%' THEN 1
        WHEN churn_reason LIKE '%Technical%' THEN 1
        ELSE 0
    END as matched_reason
FROM subscriptions
WHERE status = 'CHURNED'
ORDER BY subscription_id;

--- Query 8.15: Pad strings
SELECT 
    customer_id,
    customer_name,
    LPAD(customer_id, 6, '0') as padded_id,
    RPAD(customer_name, 30, '.') as padded_name,
    LPAD(ROUND(MONTHS_BETWEEN(SYSDATE, signup_date)), 3, '0') as padded_months
FROM customers
ORDER BY customer_id;

--- Query 8.16: Find similar names
SELECT 
    c1.customer_id,
    c1.customer_name,
    c2.customer_id,
    c2.customer_name
FROM customers c1
JOIN customers c2 ON LOWER(c1.customer_name) = LOWER(c2.customer_name)
    AND c1.customer_id < c2.customer_id
ORDER BY c1.customer_name;

--- Query 8.17: Parse subscription type details
SELECT 
    subscription_id,
    subscription_type,
    CASE 
        WHEN subscription_type = 'Free_Trial' THEN 'Trial'
        WHEN subscription_type = 'Basic' THEN 'Standard'
        WHEN subscription_type = 'Premium' THEN 'Advanced'
        WHEN subscription_type = 'Family' THEN 'Shared'
        WHEN subscription_type = 'Pro' THEN 'Enterprise'
    END as plan_category,
    CASE 
        WHEN monthly_price = 0 THEN 'Free'
        WHEN monthly_price < 20 THEN 'Budget'
        WHEN monthly_price < 40 THEN 'Standard'
        ELSE 'Premium'
    END as price_category
FROM subscriptions
ORDER BY subscription_id;

--- Query 8.18: Remove special characters
SELECT 
    customer_id,
    customer_name,
    TRANSLATE(customer_name, 'aeiouAEIOU', '') as no_vowels,
    REGEXP_REPLACE(customer_name, '[^a-zA-Z ]', '') as letters_only
FROM customers
ORDER BY customer_id;

--- Query 8.19: Extract initials
SELECT 
    customer_id,
    customer_name,
    SUBSTR(customer_name, 1, 1) as first_initial,
    SUBSTR(customer_name, INSTR(customer_name, ' ') + 1, 1) as last_initial,
    SUBSTR(customer_name, 1, 1) || SUBSTR(customer_name, INSTR(customer_name, ' ') + 1, 1) as initials
FROM customers
ORDER BY customer_id;

--- Query 8.20: String validation and classification
SELECT 
    customer_id,
    email,
    CASE 
        WHEN email LIKE '%@%.%' THEN 'Valid Email'
        ELSE 'Invalid Email'
    END as email_validity,
    CASE 
        WHEN INSTR(email, '+') > 0 THEN 'Alias Email'
        ELSE 'Standard Email'
    END as email_type
FROM customers
ORDER BY customer_id;

---- Query 9.1: ROW_NUMBER - Rank customers by lifetime value
SELECT 
    customer_id,
    customer_name,
    total_ltv,
    ROW_NUMBER() OVER (ORDER BY total_ltv DESC) as ltv_rank,
    ROW_NUMBER() OVER (ORDER BY total_ltv ASC) as ltv_rank_asc
FROM (
    SELECT 
        customer_id,
        customer_name,
        SUM(lifetime_value_usd) as total_ltv
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name
)
ORDER BY ltv_rank;

--- Query 9.2: ROW_NUMBER with PARTITION - Rank within each subscription type
SELECT 
    subscription_type,
    customer_id,
    lifetime_value_usd,
    ROW_NUMBER() OVER (PARTITION BY subscription_type ORDER BY lifetime_value_usd DESC) as rank_within_type
FROM subscriptions
ORDER BY subscription_type, rank_within_type;

--- Query 9.3: RANK - Handle ties in revenue
SELECT 
    customer_id,
    customer_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) as revenue_rank,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) as dense_revenue_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        ROUND(SUM(s.lifetime_value_usd), 2) as total_revenue
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name
)
ORDER BY revenue_rank;

--- Query 9.4: DENSE_RANK - Churn rate classification
SELECT 
    subscription_type,
    churn_rate,
    DENSE_RANK() OVER (ORDER BY churn_rate DESC) as churn_severity_rank
FROM (
    SELECT 
        subscription_type,
        ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate
    FROM subscriptions
    GROUP BY subscription_type
)
ORDER BY churn_severity_rank;

--- Query 9.5: LAG - Compare current month to previous month
SELECT 
    year_month,
    total_hours,
    LAG(total_hours) OVER (ORDER BY year_month) as prev_month_hours,
    total_hours - LAG(total_hours) OVER (ORDER BY year_month) as month_over_month_change,
    ROUND((total_hours - LAG(total_hours) OVER (ORDER BY year_month)) / 
           LAG(total_hours) OVER (ORDER BY year_month) * 100, 2) as pct_change
FROM (
    SELECT 
        year_month,
        SUM(total_hours_watched) as total_hours
    FROM usage_metrics
    GROUP BY year_month
)
ORDER BY year_month;

--- Query 9.6: LEAD - Predict next month usage
SELECT 
    year_month,
    total_hours,
    LEAD(total_hours) OVER (ORDER BY year_month) as next_month_hours,
    LEAD(total_hours) OVER (ORDER BY year_month) - total_hours as projected_change
FROM (
    SELECT 
        year_month,
        SUM(total_hours_watched) as total_hours
    FROM usage_metrics
    GROUP BY year_month
)
ORDER BY year_month DESC;

--- Query 9.7: LAG/LEAD - Customer engagement trend
SELECT 
    customer_id,
    year_month,
    engagement_score,
    LAG(engagement_score) OVER (PARTITION BY customer_id ORDER BY year_month) as prev_engagement,
    LEAD(engagement_score) OVER (PARTITION BY customer_id ORDER BY year_month) as next_engagement,
    engagement_score - LAG(engagement_score) OVER (PARTITION BY customer_id ORDER BY year_month) as engagement_change
FROM usage_metrics
WHERE customer_id IN (SELECT customer_id FROM customers LIMIT 100)
ORDER BY customer_id, year_month;

--- Query 9.8: ROW_NUMBER for pagination
SELECT 
    customer_id,
    customer_name,
    email,
    rn
FROM (
    SELECT 
        customer_id,
        customer_name,
        email,
        ROW_NUMBER() OVER (ORDER BY customer_id) as rn
    FROM customers
)
WHERE rn BETWEEN 1 AND 50
ORDER BY rn;

--- Query 9.9: RANK with multiple partitions
SELECT 
    country,
    acquisition_channel,
    customer_count,
    RANK() OVER (PARTITION BY country ORDER BY customer_count DESC) as channel_rank_in_country,
    RANK() OVER (ORDER BY customer_count DESC) as global_channel_rank
FROM (
    SELECT 
        c.country,
        c.acquisition_channel,
        COUNT(DISTINCT c.customer_id) as customer_count
    FROM customers c
    GROUP BY c.country, c.acquisition_channel
)
ORDER BY country, channel_rank_in_country;

--- Query 9.10: Find top N per group using ROW_NUMBER
SELECT 
    subscription_type,
    customer_id,
    lifetime_value_usd,
    rank_in_type
FROM (
    SELECT 
        subscription_type,
        customer_id,
        lifetime_value_usd,
        ROW_NUMBER() OVER (PARTITION BY subscription_type ORDER BY lifetime_value_usd DESC) as rank_in_type
    FROM subscriptions
)
WHERE rank_in_type <= 10
ORDER BY subscription_type, rank_in_type;

--- Query 9.11: DENSE_RANK for percentile calculation
SELECT 
    customer_id,
    total_ltv,
    DENSE_RANK() OVER (ORDER BY total_ltv DESC) as percentile_rank,
    CASE 
        WHEN DENSE_RANK() OVER (ORDER BY total_ltv DESC) <= (SELECT COUNT(DISTINCT customer_id) * 0.1 FROM subscriptions) THEN 'Top 10%'
        WHEN DENSE_RANK() OVER (ORDER BY total_ltv DESC) <= (SELECT COUNT(DISTINCT customer_id) * 0.25 FROM subscriptions) THEN 'Top 25%'
        ELSE 'Bottom 75%'
    END as percentile_bracket
FROM (
    SELECT 
        customer_id,
        SUM(lifetime_value_usd) as total_ltv
    FROM subscriptions
    GROUP BY customer_id
)
ORDER BY percentile_rank;

--- Query 9.12: LAG with CASE - Churn detection
SELECT 
    subscription_id,
    customer_id,
    year_month,
    total_hours_watched,
    LAG(total_hours_watched) OVER (PARTITION BY subscription_id ORDER BY year_month) as prev_month_hours,
    CASE 
        WHEN total_hours_watched = 0 AND LAG(total_hours_watched) OVER (PARTITION BY subscription_id ORDER BY year_month) > 0 THEN 'USAGE_DROP_WARNING'
        WHEN total_hours_watched = 0 AND LAG(total_hours_watched) OVER (PARTITION BY subscription_id ORDER BY year_month) = 0 THEN 'CONTINUED_ZERO_USAGE'
        ELSE 'ACTIVE'
    END as engagement_status
FROM usage_metrics
ORDER BY subscription_id, year_month DESC;

--- Query 9.13: Running sum using SUM window function
SELECT 
    year_month,
    monthly_hours,
    SUM(monthly_hours) OVER (ORDER BY year_month) as cumulative_hours,
    SUM(monthly_hours) OVER (ORDER BY year_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as moving_avg_3mo
FROM (
    SELECT 
        year_month,
        SUM(total_hours_watched) as monthly_hours
    FROM usage_metrics
    GROUP BY year_month
)
ORDER BY year_month;

--- Query 9.14: First and last values
SELECT 
    customer_id,
    year_month,
    total_hours_watched,
    FIRST_VALUE(total_hours_watched) OVER (PARTITION BY customer_id ORDER BY year_month) as first_month_hours,
    LAST_VALUE(total_hours_watched) OVER (PARTITION BY customer_id ORDER BY year_month 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_month_hours
FROM usage_metrics
WHERE customer_id IN (SELECT customer_id FROM customers LIMIT 100)
ORDER BY customer_id, year_month;

--- Query 9.15: NTH_VALUE - Get specific percentile
SELECT 
    subscription_type,
    monthly_price,
    NTH_VALUE(monthly_price, 1) OVER (PARTITION BY subscription_type ORDER BY monthly_price) as min_price,
    NTH_VALUE(monthly_price, 2) OVER (PARTITION BY subscription_type ORDER BY monthly_price) as second_price,
    NTH_VALUE(monthly_price, COUNT(*)) OVER (PARTITION BY subscription_type ORDER BY monthly_price) as max_price
FROM subscriptions
ORDER BY subscription_type;

---Query 9.16: NTILE - Create quartiles
SELECT 
    customer_id,
    total_ltv,
    NTILE(4) OVER (ORDER BY total_ltv DESC) as ltv_quartile,
    CASE 
        WHEN NTILE(4) OVER (ORDER BY total_ltv DESC) = 1 THEN 'Top_Quartile'
        WHEN NTILE(4) OVER (ORDER BY total_ltv DESC) = 2 THEN 'Second_Quartile'
        WHEN NTILE(4) OVER (ORDER BY total_ltv DESC) = 3 THEN 'Third_Quartile'
        ELSE 'Bottom_Quartile'
    END as ltv_segment
FROM (
    SELECT 
        customer_id,
        SUM(lifetime_value_usd) as total_ltv
    FROM subscriptions
    GROUP BY customer_id
)
ORDER BY ltv_quartile;

---- Query 9.17: ROW_NUMBER for deduplication
SELECT 
    customer_id,
    email,
    country,
    signup_date
FROM (
    SELECT 
        customer_id,
        email,
        country,
        signup_date,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) as rn
    FROM customers
)
WHERE rn = 1
ORDER BY customer_id;

--- Query 9.18: LAG with NULL handling
SELECT 
    year_month,
    active_customers,
    LAG(active_customers) OVER (ORDER BY year_month) as prev_month_customers,
    COALESCE(active_customers - LAG(active_customers) OVER (ORDER BY year_month), 0) as customer_change
FROM (
    SELECT 
        year_month,
        COUNT(DISTINCT customer_id) as active_customers
    FROM usage_metrics
    GROUP BY year_month
)
ORDER BY year_month;

--- Query 9.19: Rank support tickets by satisfaction
SELECT 
    ticket_id,
    customer_id,
    satisfaction_score,
    RANK() OVER (ORDER BY satisfaction_score DESC) as satisfaction_rank,
    ROW_NUMBER() OVER (ORDER BY satisfaction_score DESC) as ticket_rn
FROM support_tickets
ORDER BY satisfaction_rank;

--- Query 9.20: PERCENT_RANK - Percentile distribution
SELECT 
    customer_id,
    total_ltv,
    PERCENT_RANK() OVER (ORDER BY total_ltv) as ltv_percentile,
    ROUND(PERCENT_RANK() OVER (ORDER BY total_ltv) * 100, 2) as percentile_position
FROM (
    SELECT 
        customer_id,
        SUM(lifetime_value_usd) as total_ltv
    FROM subscriptions
    GROUP BY customer_id
)
ORDER BY percentile_position DESC;

--- Query 9.21: CUME_DIST - Cumulative distribution
SELECT 
    subscription_type,
    churn_rate,
    CUME_DIST() OVER (ORDER BY churn_rate) as cumulative_distribution
FROM (
    SELECT 
        subscription_type,
        ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate
    FROM subscriptions
    GROUP BY subscription_type
)
ORDER BY churn_rate DESC;

--- Query 9.22: Multiple window functions combined
SELECT 
    customer_id,
    year_month,
    total_hours,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY year_month) as month_count,
    LAG(total_hours) OVER (PARTITION BY customer_id ORDER BY year_month) as prev_hours,
    LEAD(total_hours) OVER (PARTITION BY customer_id ORDER BY year_month) as next_hours,
    AVG(total_hours) OVER (PARTITION BY customer_id) as avg_hours_per_customer
FROM (
    SELECT 
        customer_id,
        year_month,
        SUM(total_hours_watched) as total_hours
    FROM usage_metrics
    GROUP BY customer_id, year_month
)
WHERE customer_id IN (SELECT customer_id FROM customers LIMIT 50)
ORDER BY customer_id, year_month;

--- Query 9.23: Window frame specification
SELECT 
    year_month,
    monthly_revenue,
    AVG(monthly_revenue) OVER (
        ORDER BY year_month 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) as moving_avg_3mo,
    SUM(monthly_revenue) OVER (
        ORDER BY year_month 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as cumulative_revenue
FROM (
    SELECT 
        year_month,
        SUM(lifetime_value_usd) as monthly_revenue
    FROM subscriptions
    GROUP BY year_month
)
ORDER BY year_month;

--- Query 9.24: Partition by multiple columns
SELECT 
    country,
    subscription_type,
    avg_satisfaction,
    RANK() OVER (PARTITION BY country ORDER BY avg_satisfaction DESC) as rank_in_country,
    RANK() OVER (PARTITION BY subscription_type ORDER BY avg_satisfaction DESC) as rank_in_type
FROM (
    SELECT 
        c.country,
        s.subscription_type,
        ROUND(AVG(st.satisfaction_score), 2) as avg_satisfaction
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    JOIN support_tickets st ON c.customer_id = st.customer_id
    GROUP BY c.country, s.subscription_type
)
ORDER BY country, rank_in_country;

--- Query 9.25: Lead/Lag with aggregation
SELECT 
    year_month,
    customer_count,
    LAG(customer_count) OVER (ORDER BY year_month) as prev_month_count,
    LEAD(customer_count) OVER (ORDER BY year_month) as next_month_count,
    customer_count - LAG(customer_count) OVER (ORDER BY year_month) as net_change,
    ROUND(100.0 * (customer_count - LAG(customer_count) OVER (ORDER BY year_month)) / 
           LAG(customer_count) OVER (ORDER BY year_month), 2) as pct_growth
FROM (
    SELECT 
        year_month,
        COUNT(DISTINCT customer_id) as customer_count
    FROM usage_metrics
    GROUP BY year_month
)
ORDER BY year_month;

--- Query 10.1: Simple CTE - Customer revenue analysis
WITH customer_revenue AS (
    SELECT 
        customer_id,
        customer_name,
        SUM(lifetime_value_usd) as total_ltv,
        COUNT(DISTINCT subscription_id) as subscription_count
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_id,
    customer_name,
    total_ltv,
    subscription_count,
    ROUND(total_ltv / subscription_count, 2) as avg_ltv_per_subscription
FROM customer_revenue
WHERE total_ltv > 100
ORDER BY total_ltv DESC;

--- Query 10.2: Multiple CTEs - Churn and revenue analysis
WITH churn_stats AS (
    SELECT 
        subscription_type,
        COUNT(*) as total_subs,
        SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned_subs,
        ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate
    FROM subscriptions
    GROUP BY subscription_type
),
revenue_stats AS (
    SELECT 
        subscription_type,
        ROUND(SUM(lifetime_value_usd), 2) as total_revenue,
        ROUND(AVG(lifetime_value_usd), 2) as avg_revenue
    FROM subscriptions
    GROUP BY subscription_type
)
SELECT 
    c.subscription_type,
    c.total_subs,
    c.churned_subs,
    c.churn_rate,
    r.total_revenue,
    r.avg_revenue
FROM churn_stats c
JOIN revenue_stats r ON c.subscription_type = r.subscription_type
ORDER BY c.churn_rate DESC;

--- Query 10.3: CTE with window function
WITH ranked_customers AS (
    SELECT 
        customer_id,
        customer_name,
        total_ltv,
        ROW_NUMBER() OVER (ORDER BY total_ltv DESC) as ltv_rank
    FROM (
        SELECT 
            c.customer_id,
            c.customer_name,
            SUM(s.lifetime_value_usd) as total_ltv
        FROM customers c
        JOIN subscriptions s ON c.customer_id = s.customer_id
        GROUP BY c.customer_id, c.customer_name
    )
)
SELECT *
FROM ranked_customers
WHERE ltv_rank <= 100
ORDER BY ltv_rank;

--- Query 10.4: Recursive CTE - Not typical for this dataset, but showing example
WITH RECURSIVE date_range AS (
    SELECT TO_DATE('2023-01-01', 'YYYY-MM-DD') as date_val
    UNION ALL
    SELECT date_val + 1
    FROM date_range
    WHERE date_val + 1 <= TO_DATE('2023-12-31', 'YYYY-MM-DD')
)
SELECT 
    date_val,
    TO_CHAR(date_val, 'Month') as month,
    TO_CHAR(date_val, 'Day') as day
FROM date_range
WHERE ROWNUM <= 365
ORDER BY date_val;

--- Query 10.5: CTE for risk segmentation
WITH engagement_metrics AS (
    SELECT 
        subscription_id,
        customer_id,
        COUNT(DISTINCT year_month) as active_months,
        SUM(CASE WHEN total_hours_watched = 0 THEN 1 ELSE 0 END) as zero_usage_months,
        ROUND(AVG(engagement_score), 2) as avg_engagement
    FROM usage_metrics
    GROUP BY subscription_id, customer_id
),
risk_assessment AS (
    SELECT 
        subscription_id,
        customer_id,
        zero_usage_months,
        avg_engagement,
        CASE 
            WHEN zero_usage_months >= 2 THEN 'CRITICAL'
            WHEN zero_usage_months = 1 AND avg_engagement < 50 THEN 'HIGH'
            WHEN avg_engagement < 25 THEN 'MEDIUM'
            ELSE 'LOW'
        END as churn_risk
    FROM engagement_metrics
)
SELECT *
FROM risk_assessment
WHERE churn_risk IN ('CRITICAL', 'HIGH')
ORDER BY churn_risk DESC, avg_engagement;

--- Query 10.6: CTE with JOIN and aggregation
WITH customer_metrics AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.country,
        c.acquisition_channel,
        COUNT(DISTINCT s.subscription_id) as total_subscriptions,
        SUM(s.lifetime_value_usd) as total_revenue,
        SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) as churned_count
    FROM customers c
    LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name, c.country, c.acquisition_channel
)
SELECT 
    country,
    acquisition_channel,
    COUNT(*) as customers,
    ROUND(AVG(total_revenue), 2) as avg_revenue,
    ROUND(AVG(churned_count), 2) as avg_churned
FROM customer_metrics
GROUP BY country, acquisition_channel
ORDER BY avg_revenue DESC;

--- Query 10.7: CTE for RFM analysis
WITH rfm_data AS (
    SELECT 
        customer_id,
        TRUNC(SYSDATE - MAX(start_date)) as recency_days,
        COUNT(DISTINCT subscription_id) as frequency,
        SUM(lifetime_value_usd) as monetary
    FROM subscriptions
    GROUP BY customer_id
),
rfm_scored AS (
    SELECT 
        customer_id,
        recency_days,
        frequency,
        monetary,
        NTILE(4) OVER (ORDER BY recency_days DESC) as r_score,
        NTILE(4) OVER (ORDER BY frequency) as f_score,
        NTILE(4) OVER (ORDER BY monetary) as m_score
    FROM rfm_data
)
SELECT 
    customer_id,
    r_score,
    f_score,
    m_score,
    r_score + f_score + m_score as total_rfm_score,
    CASE 
        WHEN r_score = 4 AND f_score = 4 AND m_score = 4 THEN 'CHAMPIONS'
        WHEN f_score = 4 AND m_score = 4 THEN 'LOYAL'
        WHEN r_score = 4 THEN 'RECENT_BUYERS'
        WHEN r_score <= 2 THEN 'AT_RISK'
        ELSE 'NEED_ATTENTION'
    END as segment
FROM rfm_scored
ORDER BY total_rfm_score DESC;

--- Query 10.8: CTE with date-based filtering
WITH support_timeline AS (
    SELECT 
        customer_id,
        MAX(ticket_date) as last_ticket_date,
        COUNT(*) as total_tickets,
        SUM(CASE WHEN customer_sentiment = 'Negative' THEN 1 ELSE 0 END) as negative_tickets,
        TRUNC(SYSDATE - MAX(ticket_date)) as days_since_last_ticket
    FROM support_tickets
    GROUP BY customer_id
)
SELECT 
    customer_id,
    last_ticket_date,
    total_tickets,
    negative_tickets,
    days_since_last_ticket,
    CASE 
        WHEN days_since_last_ticket <= 7 THEN 'Very_Recent_Issue'
        WHEN days_since_last_ticket <= 30 THEN 'Recent_Issue'
        WHEN days_since_last_ticket <= 90 THEN 'Older_Issue'
        ELSE 'Long_Ago'
    END as issue_recency
FROM support_timeline
WHERE days_since_last_ticket <= 90
ORDER BY days_since_last_ticket;

--- Query 10.9: Nested CTEs
WITH subscription_stats AS (
    SELECT 
        subscription_type,
        COUNT(*) as total,
        SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
        ROUND(SUM(lifetime_value_usd), 2) as revenue
    FROM subscriptions
    GROUP BY subscription_type
),
ranked_plans AS (
    SELECT 
        subscription_type,
        total,
        churned,
        revenue,
        RANK() OVER (ORDER BY revenue DESC) as revenue_rank,
        RANK() OVER (ORDER BY (churned * 100.0 / total) DESC) as churn_rank
    FROM subscription_stats
)
SELECT *
FROM ranked_plans
ORDER BY revenue_rank;

--- Query 10.10: CTE for cohort analysis
WITH cohorts AS (
    SELECT 
        TO_CHAR(signup_date, 'YYYY-MM') as signup_cohort,
        customer_id,
        TRUNC(MONTHS_BETWEEN(SYSDATE, signup_date)) as months_as_customer,
        (SELECT COUNT(DISTINCT subscription_id) 
         FROM subscriptions 
         WHERE customer_id = c.customer_id AND status = 'ACTIVE') as active_subscriptions
    FROM customers c
),
cohort_metrics AS (
    SELECT 
        signup_cohort,
        COUNT(DISTINCT customer_id) as cohort_size,
        SUM(CASE WHEN active_subscriptions > 0 THEN 1 ELSE 0 END) as still_active,
        ROUND((SUM(CASE WHEN active_subscriptions > 0 THEN 1 ELSE 0 END) * 100.0 / 
               COUNT(DISTINCT customer_id)), 2) as retention_rate
    FROM cohorts
    GROUP BY signup_cohort
)
SELECT *
FROM cohort_metrics
ORDER BY signup_cohort;

--- Query 10.11: CTE with string operations
WITH email_parsed AS (
    SELECT 
        customer_id,
        email,
        SUBSTR(email, 1, INSTR(email, '@') - 1) as username,
        SUBSTR(email, INSTR(email, '@') + 1) as domain,
        CASE 
            WHEN email LIKE '%gmail%' THEN 'Gmail'
            WHEN email LIKE '%yahoo%' THEN 'Yahoo'
            WHEN email LIKE '%outlook%' THEN 'Outlook'
            ELSE 'Other'
        END as email_provider
    FROM customers
)
SELECT 
    email_provider,
    COUNT(*) as customer_count,
    COUNT(DISTINCT domain) as unique_domains
FROM email_parsed
GROUP BY email_provider
ORDER BY customer_count DESC;

--- Query 10.12: CTE for anomaly detection
WITH monthly_stats AS (
    SELECT 
        year_month,
        SUM(total_hours_watched) as monthly_hours,
        COUNT(DISTINCT customer_id) as active_customers,
        ROUND(AVG(total_hours_watched), 2) as avg_hours
    FROM usage_metrics
    GROUP BY year_month
),
stats_with_avg AS (
    SELECT 
        *,
        AVG(monthly_hours) OVER () as overall_avg,
        STDDEV(monthly_hours) OVER () as overall_stddev
    FROM monthly_stats
)
SELECT 
    year_month,
    monthly_hours,
    overall_avg,
    overall_stddev,
    (monthly_hours - overall_avg) / overall_stddev as z_score,
    CASE 
        WHEN ABS((monthly_hours - overall_avg) / overall_stddev) > 2 THEN 'ANOMALY'
        ELSE 'NORMAL'
    END as status
FROM stats_with_avg
ORDER BY z_score DESC;

--- Query 10.13: CTE for competitive analysis
WITH plan_performance AS (
    SELECT 
        subscription_type,
        COUNT(*) as total_subscriptions,
        SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned,
        ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate,
        ROUND(AVG(lifetime_value_usd), 2) as avg_ltv,
        ROUND(SUM(lifetime_value_usd), 2) as total_revenue
    FROM subscriptions
    GROUP BY subscription_type
),
plan_ranking AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY churn_rate ASC) as churn_rank,
        RANK() OVER (ORDER BY avg_ltv DESC) as ltv_rank,
        RANK() OVER (ORDER BY total_revenue DESC) as revenue_rank
    FROM plan_performance
)
SELECT *
FROM plan_ranking
ORDER BY churn_rank;

--- Query 10.14: CTE with case-based categorization
WITH customer_classification AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.age_group,
        c.estimated_income,
        COUNT(DISTINCT s.subscription_id) as subscription_count,
        SUM(s.lifetime_value_usd) as total_ltv,
        CASE 
            WHEN SUM(s.lifetime_value_usd) > 1000 THEN 'High_Value'
            WHEN SUM(s.lifetime_value_usd) > 500 THEN 'Medium_Value'
            ELSE 'Low_Value'
        END as value_segment,
        CASE 
            WHEN COUNT(DISTINCT s.subscription_id) > 2 THEN 'Multi_Subscriber'
            WHEN COUNT(DISTINCT s.subscription_id) = 2 THEN 'Dual_Subscriber'
            ELSE 'Single_Subscriber'
        END as subscription_segment
    FROM customers c
    LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.customer_name, c.age_group, c.estimated_income
)
SELECT 
    value_segment,
    subscription_segment,
    COUNT(*) as customers,
    ROUND(AVG(total_ltv), 2) as avg_ltv
FROM customer_classification
WHERE total_ltv > 0
GROUP BY value_segment, subscription_segment
ORDER BY avg_ltv DESC;

--- Query 10.15: CTE for time-series analysis
WITH monthly_trends AS (
    SELECT 
        year_month,
        COUNT(DISTINCT customer_id) as new_customers,
        SUM(total_hours_watched) as total_hours,
        ROUND(AVG(engagement_score), 2) as avg_engagement
    FROM usage_metrics
    GROUP BY year_month
),
trend_with_lag AS (
    SELECT 
        year_month,
        new_customers,
        LAG(new_customers) OVER (ORDER BY year_month) as prev_month_customers,
        total_hours,
        LAG(total_hours) OVER (ORDER BY year_month) as prev_month_hours,
        ROUND((new_customers - LAG(new_customers) OVER (ORDER BY year_month)) / 
               LAG(new_customers) OVER (ORDER BY year_month) * 100, 2) as customer_growth_pct
    FROM monthly_trends
)
SELECT *
FROM trend_with_lag
ORDER BY year_month;

--- Query 10.16: CTE with conditional aggregation
WITH ticket_analysis AS (
    SELECT 
        customer_id,
        COUNT(*) as total_tickets,
        COUNT(CASE WHEN customer_sentiment = 'Negative' THEN 1 END) as negative_tickets,
        COUNT(CASE WHEN status = 'Resolved' THEN 1 END) as resolved_tickets,
        COUNT(CASE WHEN status != 'Resolved' THEN 1 END) as unresolved_tickets,
        ROUND(AVG(satisfaction_score), 2) as avg_satisfaction,
        ROUND(AVG(resolution_time_hours), 2) as avg_resolution_time
    FROM support_tickets
    GROUP BY customer_id
),
ticket_risk AS (
    SELECT 
        customer_id,
        total_tickets,
        negative_tickets,
        unresolved_tickets,
        avg_satisfaction,
        CASE 
            WHEN negative_tickets > total_tickets * 0.5 THEN 'HIGH_RISK'
            WHEN unresolved_tickets > 0 THEN 'MEDIUM_RISK'
            ELSE 'LOW_RISK'
        END as support_risk
    FROM ticket_analysis
)
SELECT *
FROM ticket_risk
WHERE support_risk != 'LOW_RISK'
ORDER BY customer_id;

--- Query 10.17: CTE with self-join pattern
WITH customer_pairs AS (
    SELECT 
        c1.customer_id as cust1_id,
        c1.customer_name as cust1_name,
        c1.country as cust1_country,
        c2.customer_id as cust2_id,
        c2.customer_name as cust2_name,
        c2.country as cust2_country
    FROM customers c1
    JOIN customers c2 ON c1.country = c2.country 
        AND c1.customer_id < c2.customer_id
        AND c1.age_group = c2.age_group
)
SELECT 
    cust1_country,
    COUNT(*) as matching_pairs
FROM customer_pairs
GROUP BY cust1_country
ORDER BY matching_pairs DESC;

--- Query 10.18: CTE with aggregation across dimensions
WITH multi_dim_analysis AS (
    SELECT 
        c.country,
        c.age_group,
        s.subscription_type,
        COUNT(*) as subscriptions,
        SUM(s.lifetime_value_usd) as revenue,
        SUM(CASE WHEN s.status = 'CHURNED' THEN 1 ELSE 0 END) as churned
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    GROUP BY c.country, c.age_group, s.subscription_type
)
SELECT 
    country,
    age_group,
    subscription_type,
    subscriptions,
    ROUND(revenue, 2) as revenue,
    ROUND((churned * 100.0 / subscriptions), 2) as churn_rate
FROM multi_dim_analysis
WHERE subscriptions >= 10
ORDER BY revenue DESC;

---- Query 10.19: CTE with union
WITH active_metrics AS (
    SELECT 
        subscription_id,
        'ACTIVE' as status,
        COUNT(DISTINCT year_month) as active_months
    FROM usage_metrics
    GROUP BY subscription_id
),
churned_metrics AS (
    SELECT 
        subscription_id,
        'CHURNED' as status,
        1 as active_months
    FROM subscriptions
    WHERE status = 'CHURNED'
)
SELECT *
FROM (
    SELECT * FROM active_metrics
    UNION ALL
    SELECT * FROM churned_metrics
)
ORDER BY status, subscription_id;

--- Query 10.20: Complex nested CTE
WITH base_data AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.country,
        s.subscription_id,
        s.subscription_type,
        s.status,
        u.engagement_score,
        st.satisfaction_score
    FROM customers c
    JOIN subscriptions s ON c.customer_id = s.customer_id
    LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
    LEFT JOIN support_tickets st ON c.customer_id = st.customer_id
),
aggregated_data AS (
    SELECT 
        customer_id,
        customer_name,
        country,
        COUNT(DISTINCT subscription_id) as subs,
        ROUND(AVG(engagement_score), 2) as avg_engagement,
        ROUND(AVG(satisfaction_score), 2) as avg_satisfaction,
        SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) as churned_count
    FROM base_data
    GROUP BY customer_id, customer_name, country
),
final_classification AS (
    SELECT 
        *,
        CASE 
            WHEN avg_engagement >= 75 AND avg_satisfaction >= 4 THEN 'VIP'
            WHEN avg_engagement >= 50 THEN 'Regular'
            ELSE 'At_Risk'
        END as customer_tier
    FROM aggregated_data
)
SELECT *
FROM final_classification
ORDER BY customer_tier, avg_satisfaction DESC;

--- Procedure 11.1: Calculate monthly churn metrics
CREATE OR REPLACE PROCEDURE calc_monthly_churn
AS
    v_current_churn NUMBER;
    v_total_subs NUMBER;
    v_churned_subs NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total_subs FROM subscriptions;
    
    SELECT COUNT(*) INTO v_churned_subs 
    FROM subscriptions WHERE status = 'CHURNED';
    
    v_current_churn := ROUND((v_churned_subs / v_total_subs) * 100, 2);
    
    INSERT INTO churn_audit_log (churn_date, churn_rate, created_at)
    VALUES (SYSDATE, v_current_churn, SYSTIMESTAMP);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Churn Rate: ' || v_current_churn || '%');
    DBMS_OUTPUT.PUT_LINE('Total Subs: ' || v_total_subs);
    DBMS_OUTPUT.PUT_LINE('Churned: ' || v_churned_subs);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END calc_monthly_churn;
/

-- Execute:
EXEC calc_monthly_churn;

--- Procedure 11.2: Identify and flag at-risk customers
CREATE OR REPLACE PROCEDURE identify_at_risk_customers
AS
    v_inserted_count NUMBER := 0;
BEGIN
    DELETE FROM at_risk_customers_flag;
    
    INSERT INTO at_risk_customers_flag (customer_id, subscription_id, risk_level, identified_date)
    SELECT 
        s.customer_id,
        s.subscription_id,
        CASE 
            WHEN ROUND(AVG(u.total_hours_watched), 2) = 0 THEN 'CRITICAL'
            WHEN ROUND(AVG(u.total_hours_watched), 2) < 5 THEN 'HIGH'
            WHEN ROUND(AVG(u.total_hours_watched), 2) < 20 THEN 'MEDIUM'
            ELSE 'LOW'
        END as risk_level,
        SYSDATE as identified_date
    FROM subscriptions s
    LEFT JOIN usage_metrics u ON s.subscription_id = u.subscription_id
    WHERE s.status = 'ACTIVE'
    GROUP BY s.customer_id, s.subscription_id;
    
    v_inserted_count := SQL%ROWCOUNT;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Flagged ' || v_inserted_count || ' at-risk customers');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END identify_at_risk_customers;
/

EXEC identify_at_risk_customers;

--- Procedure 11.3: Generate daily churn report
CREATE OR REPLACE PROCEDURE generate_churn_report
AS
    v_report_date DATE := TRUNC(SYSDATE);
    v_total_churn NUMBER;
    v_free_trial_churn NUMBER;
    v_paid_churn NUMBER;
    v_revenue_impact NUMBER;
BEGIN
    SELECT ROUND((SUM(CASE WHEN status = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2)
    INTO v_total_churn
    FROM subscriptions;
    
    SELECT COUNT(*)
    INTO v_free_trial_churn
    FROM subscriptions
    WHERE status = 'CHURNED' AND subscription_type = 'Free_Trial';
    
    SELECT SUM(monthly_price * 12)
    INTO v_revenue_impact
    FROM subscriptions
    WHERE status = 'CHURNED';
    
    INSERT INTO churn_reports (report_date, total_churn_rate, free_trial_churned, revenue_at_risk, created_at)
    VALUES (v_report_date, v_total_churn, v_free_trial_churn, v_revenue_impact, SYSTIMESTAMP);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('=== DAILY CHURN REPORT ===');
    DBMS_OUTPUT.PUT_LINE('Date: ' || v_report_date);
    DBMS_OUTPUT.PUT_LINE('Total Churn Rate: ' || v_total_churn || '%');
    DBMS_OUTPUT.PUT_LINE('Free Trial Churned: ' || v_free_trial_churn);
    DBMS_OUTPUT.PUT_LINE('Annual Revenue at Risk: $' || ROUND(v_revenue_impact, 2));
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in report generation: ' || SQLERRM);
        ROLLBACK;
END generate_churn_report;
/

EXEC generate_churn_report;

---Procedure 11.4: Update customer RFM scores
CREATE OR REPLACE PROCEDURE update_rfm_scores
AS
    v_updated_count NUMBER := 0;
BEGIN
    MERGE INTO customer_rfm_scores t
    USING (
        SELECT 
            customer_id,
            NTILE(4) OVER (ORDER BY TRUNC(SYSDATE - MAX(start_date)) DESC) as r_score,
            NTILE(4) OVER (ORDER BY COUNT(DISTINCT subscription_id)) as f_score,
            NTILE(4) OVER (ORDER BY SUM(lifetime_value_usd)) as m_score
        FROM subscriptions
        GROUP BY customer_id
    ) s
    ON (t.customer_id = s.customer_id)
    WHEN MATCHED THEN
        UPDATE SET 
            t.r_score = s.r_score,
            t.f_score = s.f_score,
            t.m_score = s.m_score,
            t.updated_at = SYSTIMESTAMP
    WHEN NOT MATCHED THEN
        INSERT (customer_id, r_score, f_score, m_score, created_at, updated_at)
        VALUES (s.customer_id, s.r_score, s.f_score, s.m_score, SYSTIMESTAMP, SYSTIMESTAMP);
    
    v_updated_count := SQL%ROWCOUNT;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Updated RFM scores for ' || v_updated_count || ' customers');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END update_rfm_scores;
/

EXEC update_rfm_scores;

--- Procedure 11.5: Archive churned customers
CREATE OR REPLACE PROCEDURE archive_churned_data
    (p_days_old NUMBER DEFAULT 90)
AS
    v_archived_count NUMBER := 0;
BEGIN
    -- Archive to historical table
    INSERT INTO churned_customers_archive
    SELECT *
    FROM subscriptions
    WHERE status = 'CHURNED'
        AND TRUNC(SYSDATE - end_date) > p_days_old;
    
    v_archived_count := SQL%ROWCOUNT;
    
    -- Delete from main table
    DELETE FROM subscriptions
    WHERE status = 'CHURNED'
        AND TRUNC(SYSDATE - end_date) > p_days_old;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Archived ' || v_archived_count || ' churned records older than ' || p_days_old || ' days');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END archive_churned_data;
/

EXEC archive_churned_data(90);