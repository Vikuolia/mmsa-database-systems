SELECT p.first_name, p.last_name, COUNT(DISTINCT(o.id)) as order_id, SUM(oi.quantity) as quantity, SUM((oi.quantity*(i.price-oi.discount))) AS total_money
FROM person p LEFT JOIN         
			 (order_ o 
             JOIN order_item oi ON o.id = oi.order_id
             JOIN item i
             ON oi.item_id = i.id  
             ) ON p.id = o.person_id
GROUP BY p.id