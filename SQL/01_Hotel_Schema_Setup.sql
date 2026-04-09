SELECT u.user_id, b.room_no
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(booking_date) FROM bookings WHERE user_id = u.user_id
);

SELECT b.booking_id, SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', b.booking_date) = '2021-11'
GROUP BY b.booking_id;

SELECT bc.bill_id, SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING bill_amount > 1000;

SELECT strftime('%m', bc.bill_date) AS month, i.item_name, SUM(bc.item_quantity) AS total_quantity
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y', bc.bill_date) = '2021'
GROUP BY month, i.item_name
ORDER BY month, total_quantity DESC;

SELECT month, user_id, bill_id, bill_amount
FROM (
    SELECT strftime('%m', bc.bill_date) AS month, b.user_id, bc.bill_id, SUM(bc.item_quantity * i.item_rate) AS bill_amount
    FROM booking_commercials bc
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bc.bill_date) = '2021'
    GROUP BY month, bc.bill_id
    ORDER BY month, bill_amount DESC
)
GROUP BY month
HAVING bill_amount = MAX(bill_amount);