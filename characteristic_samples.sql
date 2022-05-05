# Характерные выборки
# Определение страны (правил дома и дополнительной информации), в которой расположено жильё с ценой большей, 
# чем средняя арифметическая стоимость жилья. Данное жильё должно быть востребованным, то есть минимум на него
# должeн быть успешно оформлен 1 заказ.
# Использовано common table expression для того, чтобы не писать подзапрос для нахождения средней стоимости аренды трижды
WITH `average_price`(`average_price`) AS (SELECT AVG(`price_per_day`) FROM `housing`)
SELECT `title`, `location_country`, `address`, `description`, `price_per_day`, `average_price`, `price_per_day` - `average_price`
AS `price_sd`, `guests_max_quantity`, `housing_rules`  FROM `housing` INNER JOIN `orders` ON `housing`.id = `orders`.housing_id, 
`average_price` WHERE `price_per_day` > `average_price` AND `status` = "Оплачен полностью"  ORDER BY `price_per_day` DESC;

# Вывод основной информации о всех заказах
SELECT (SELECT CONCAT(`lastname`," ", `firstname`) FROM `users` WHERE `users`.id = `housing`.user_id) AS `renter`, `housing`.title AS `title`,
`housing_types`.title AS `housing_type`, CONCAT(`location_country`, ", ", `location_city`, ", ", `address`) AS `full_address`, 
(SELECT CONCAT(`lastname`," ", `firstname`) FROM `users` WHERE `users`.id = `orders`.user_id) AS `client`, `guests_quantity`, `day_quantity`, 
`price_per_day`, `total_price_without_bonus`, IF(`bonus_amount` IS NULL, 0, `bonus_amount`) AS `bonus_amount`, `total_price`,
`orders`.status AS `status`, `paid_amount` FROM `orders` INNER JOIN `housing` ON `orders`.housing_id = `housing`.id INNER JOIN `housing_types` 
ON `housing`.housing_type_id = `housing_types`.id LEFT JOIN `bonuses` ON `orders`.id = `bonuses`.order_id;

# Определить сколько заказов забронировано либо оплачено для каждого статуса и месяца, в котором происходит заселение
SELECT DATE_FORMAT(`arrival_date`,"%M %Y") AS `month`, COUNT(*) AS `orders_quantity`, `status` FROM `orders`
GROUP BY DATE_FORMAT(`arrival_date`,"%M %Y"), `status` HAVING `status` <> "Отменён";


