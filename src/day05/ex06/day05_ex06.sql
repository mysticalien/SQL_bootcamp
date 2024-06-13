CREATE INDEX idx_1 ON pizzeria(rating);
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name, max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
JOIN pizzeria ON m.pizzeria_id = pizzeria.id
ORDER BY 1, 2;

DROP INDEX idx_1;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name, max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
JOIN pizzeria ON m.pizzeria_id = pizzeria.id
ORDER BY 1, 2;
