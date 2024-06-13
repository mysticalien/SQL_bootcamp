CREATE INDEX idx_person_name ON person(UPPER(name));
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT name
FROM person
WHERE UPPER(name) = 'Kate';