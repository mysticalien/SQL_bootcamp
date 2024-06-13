SELECT
    COALESCE(p.name, '-') AS person_name,
    v.visit_date AS visit_date,
    COALESCE(pr.name, '-') AS pizzeria_name
FROM
    (SELECT *
     FROM person_visits
     WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS v
FULL JOIN pizzeria pr ON v.pizzeria_id = pr.id
FULL JOIN person p ON v.person_id = p.id
ORDER BY 1, 2, 3;