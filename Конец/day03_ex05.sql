SELECT DISTINCT
    pz.name AS pizzeria_name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
LEFT JOIN person_order po ON p.id = po.person_id 
    AND pv.pizzeria_id = (SELECT m.pizzeria_id FROM menu m WHERE m.id = po.menu_id)
WHERE p.name = 'Andrey'
    AND po.id IS NULL
ORDER BY pz.name;