-- Удаление всех заказов с греческой пиццей на 25 февраля 2022 года
DELETE FROM person_order
WHERE order_date = '2022-02-25'
    AND menu_id = (SELECT id FROM menu WHERE pizza_name = 'greek pizza');

-- Удаление греческой пиццы из меню
DELETE FROM menu
WHERE pizza_name = 'greek pizza';