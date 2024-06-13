CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits pv
         JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
         JOIN menu ON menu.pizzeria_id = pizzeria.id
         JOIN person ON person.id = pv.person_id
WHERE visit_date = '2022-01-08' AND price < 800
ORDER BY 1