SELECT p.first_name, p.last_name, COUNT(t.order_id) as total_orders, SUM(t.quantity) as total_items_bought, SUM(t.total_money) as total_money_spent
FROM person p LEFT OUTER JOIN 
                             (SELECT o.id as order_id, o.person_id, SUM(oi.quantity) as quantity, (SUM(oi.quantity*i.price-oi.discount)) AS total_money
                              FROM order_ o 
			      JOIN order_item oi ON o.id = oi.order_id
			      JOIN item i ON oi.item_id = i.id  
			      GROUP BY o.id)t 
                              ON p.id = t.person_id
GROUP BY p.first_name
ORDER BY p.id