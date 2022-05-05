# Процедура
# Получение детальной информации об предлагаемом на платформе жилье
DELIMITER //
DROP PROCEDURE IF EXISTS `get_housing_details`//
CREATE PROCEDURE `get_housing_details`()
BEGIN
	SELECT `housing`.title AS `housing_title`, `living_comfort_types`.title AS `living_comfort_type`, `characteristics_list`.title AS 
    `characteristic`, `beds_quantity`, `bedrooms_quantity`, `bathroom_quantity` FROM `housing` LEFT JOIN `living_comfort` ON 
    `housing`.id = `living_comfort`.housing_id INNER JOIN `living_comfort_types` ON `living_comfort`.living_comfort_type_id = 
    `living_comfort_types`.id INNER JOIN `characteristics_list` ON `living_comfort_types`.characteristics_list_id = `characteristics_list`.id;
END//
DELIMITER ;

# Функция
# Расчёт стоимости жилья за день для определённого заказа с учётом бонуса при его использовании
DELIMITER //
DROP FUNCTION IF EXISTS `get_price_per_day`//
CREATE FUNCTION `get_price_per_day` (`orderid` INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	SET @price_per_day_total := (
	SELECT 
		CASE
			WHEN `orders`.status = "Отменён" THEN 0
			WHEN `bonus_amount` IS NULL OR `bonuses`.status = FALSE THEN `price_per_day`
            WHEN `bonuses`.status = TRUE THEN `total_price` / `day_quantity`
        END
	FROM `orders` INNER JOIN `housing` ON `orders`.housing_id = `housing`.id LEFT JOIN `bonuses` ON 
    `orders`.id = `bonuses`.order_id WHERE `orders`.id = `orderid`);
    RETURN @price_per_day_total;
END//
DELIMITER ;

# Триггер
# Обновление информации об итоговой стоимости аренды в случае активации клиентом бонуса
DELIMITER //
DROP  TRIGGER IF EXISTS `update_total_price`//
CREATE TRIGGER `update_total_price` AFTER UPDATE ON `bonuses`
FOR EACH ROW
BEGIN
	SET @order_id := NEW.order_id;
	IF(NEW.status = TRUE) THEN
		UPDATE `orders` SET `total_price` = `total_price_without_bonus` - NEW.bonus_amount WHERE `id` = @order_id;
	END IF;
END //
DELIMITER ;