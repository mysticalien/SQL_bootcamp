CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, menu.pizza_name
FROM menu
WHERE pizza_name = 'mushroom pizza' AND pizzeria_id = 4;