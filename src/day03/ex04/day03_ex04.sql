WITH female_pizzerias AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    INNER JOIN person ON person_order.person_id = person.id
    WHERE person.gender = 'female'
),
male_pizzerias AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    INNER JOIN person ON person_order.person_id = person.id
    WHERE person.gender = 'male'
)
(
    SELECT pizzeria_name
    FROM female_pizzerias
    EXCEPT
    SELECT pizzeria_name
    FROM male_pizzerias
)
UNION
(
    SELECT pizzeria_name
    FROM male_pizzerias
    EXCEPT
    SELECT pizzeria_name
    FROM female_pizzerias
)
ORDER BY pizzeria_name;