CREATE VIEW v_price_with_discount AS
SELECT p.name,
       m.pizza_name,
       m.price,
       CAST(m.price * 0.9 AS INTEGER) AS discount_price
FROM person_order
         JOIN person p ON p.id = person_order.person_id
         JOIN menu m ON m.id = person_order.menu_id
ORDER BY p.name, m.pizza_name;