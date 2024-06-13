WITH data AS
  (SELECT data::date
   FROM generate_series('2022-01-01'::TIMESTAMP, '2022-01-10', '1 day') AS data)
SELECT data::date AS missing_data
FROM
  (SELECT visit_date
   FROM person_visits
   WHERE person_id = 1 OR person_id = 2) AS sorted_visits
RIGHT JOIN data ON sorted_visits.visit_date = data
WHERE sorted_visits.visit_date IS NULL
ORDER BY missing_data;