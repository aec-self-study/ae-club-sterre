SELECT customer_id
,name
,email
,min(created_at) as first_order_at
,count(*) as number_of_orders
FROM `analytics-engineers-club.coffee_shop.orders`
LEFT JOIN `analytics-engineers-club.coffee_shop.customers`
ON `analytics-engineers-club.coffee_shop.orders`.customer_id = `analytics-engineers-club.coffee_shop.customers`.id
GROUP BY customer_id, name, email
ORDER BY first_order_at
LIMIT 5