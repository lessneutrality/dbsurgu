#1
SELECT category, count(product_id) AS products_quantity
FROM products
GROUP BY category;

#2
SELECT SUM(quantity*price_per_unit) AS total
FROM order_items;

#3
SELECT c.full_name, count(o.order_id)
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name;

#4
SELECT trim_scale(SUM(quantity*price_per_unit)/count(DISTINCT order_id)) AS total
FROM order_items;

#5
SELECT status, count(order_id)
FROM orders
GROUP BY status;

#6
SELECT category, count(product_name) AS product_quantity_in_category
FROM products
GROUP BY category
HAVING count(product_name)>1;

#7
SELECT c.full_name, count(o.order_id) AS orders_quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING count(o.order_id)>1;

#8
SELECT p.product_name, count(oi.product_id)*oi.quantity AS product_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name, oi.quantity
HAVING count(oi.product_id)*oi.quantity = (
    SELECT MAX(total)
    FROM (
        SELECT count(product_id)*quantity AS total
        FROM order_items
        GROUP BY product_id, quantity
    )
);