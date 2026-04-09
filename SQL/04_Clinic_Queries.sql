SELECT sales_channel, SUM(amount) AS total_revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel
ORDER BY total_revenue DESC;

SELECT cs.uid, c.customer_name, SUM(cs.amount) AS total_spend
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE strftime('%Y', cs.datetime) = '2021'
GROUP BY cs.uid, c.customer_name
ORDER BY total_spend DESC
LIMIT 10;

SELECT r.month, r.revenue, COALESCE(e.expenses, 0) AS expenses,
    r.revenue - COALESCE(e.expenses, 0) AS profit,
    CASE WHEN r.revenue - COALESCE(e.expenses, 0) >= 0 THEN 'profitable' ELSE 'not-profitable' END AS status
FROM (
    SELECT strftime('%m', datetime) AS month, SUM(amount) AS revenue
    FROM clinic_sales WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
) r
LEFT JOIN (
    SELECT strftime('%m', datetime) AS month, SUM(amount) AS expenses
    FROM expenses WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
) e ON r.month = e.month
ORDER BY r.month;

SELECT city, cid, clinic_name, profit
FROM (
    SELECT cl.city, cl.cid, cl.clinic_name,
        COALESCE(SUM(cs.amount), 0) - COALESCE(SUM(ex.amount), 0) AS profit
    FROM clinics cl
    LEFT JOIN clinic_sales cs ON cl.cid = cs.cid AND strftime('%Y-%m', cs.datetime) = '2021-09'
    LEFT JOIN expenses ex ON cl.cid = ex.cid AND strftime('%Y-%m', ex.datetime) = '2021-09'
    GROUP BY cl.city, cl.cid, cl.clinic_name
    ORDER BY cl.city, profit DESC
)
GROUP BY city
HAVING profit = MAX(profit);

SELECT present_state, cid, clinic_name, profit
FROM (
    SELECT cl.present_state, cl.cid, cl.clinic_name,
        COALESCE(SUM(cs.amount), 0) - COALESCE(SUM(ex.amount), 0) AS profit,
        ROW_NUMBER() OVER (PARTITION BY cl.present_state ORDER BY profit ASC) AS rnk
    FROM clinics cl
    LEFT JOIN clinic_sales cs ON cl.cid = cs.cid AND strftime('%Y-%m', cs.datetime) = '2021-09'
    LEFT JOIN expenses ex ON cl.cid = ex.cid AND strftime('%Y-%m', ex.datetime) = '2021-09'
    GROUP BY cl.present_state, cl.cid, cl.clinic_name
)
WHERE rnk = 2
ORDER BY present_state;