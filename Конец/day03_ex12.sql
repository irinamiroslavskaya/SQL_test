INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    gs.id,
    p.id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM person p
CROSS JOIN generate_series(
    (SELECT MAX(id) FROM person_order) + 1,
    (SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person)
) AS gs(id)
WHERE p.id = gs.id - (SELECT MAX(id) FROM person_order);