SELECT name FROM pizzeria
WHERE id NOT IN (
    SELECT DISTINCT pizzeria_id FROM person_visits
);

SELECT name FROM pizzeria
WHERE NOT EXISTS (
    SELECT pizzeria_id FROM person_visits
    WHERE person_visits.pizzeria_id = pizzeria.id
);