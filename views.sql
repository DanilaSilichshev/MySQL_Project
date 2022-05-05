# Представления
# Представление profile_full_info содержит общую информацию о пользователях платформы
DROP VIEW IF EXISTS `profile_full_info`;
CREATE VIEW `profile_full_info` AS 
SELECT ROW_NUMBER() OVER(ORDER BY  CONCAT(`lastname`," ", `firstname`)) AS `№`, CONCAT(`lastname`," ", `firstname`) AS `fio`, `nickname`, 
CASE   
	WHEN `gender` = "m" THEN "male"     
    WHEN `gender` = "f" THEN "female"
    WHEN `gender` = "unknown" THEN "unknown"
END AS `gender`, DATE_FORMAT(`birthday`,"%d %M %Y") AS `birthday`, `email`, `phone`, CONCAT(`country`,", ",`hometown`) AS `living_place`, 
(SELECT IF(GROUP_CONCAT(`title`) IS NOT NULL, GROUP_CONCAT(`title`), "unknown") FROM `languages` WHERE `languages`.id IN 
(SELECT `language_id` FROM `users_languages` WHERE `user_id` = `users`.id)) AS `languages`, 
CONCAT(`currency`.title," ",`abbreviation`) AS `currency` FROM `users` INNER JOIN  `profiles` ON `users`.id = `profiles`.user_id INNER JOIN 
`currency` ON `profiles`.currency_id = `currency`.id ORDER BY CONCAT(`lastname`," ", `firstname`);

# Представление wish_list_info содержит информацию о тех сохраненных в закладках жильях пользователями, 
# которые в дальнейшем были забронированы
DROP VIEW IF EXISTS `wish_list_info`;
CREATE VIEW `wish_list_info` AS SELECT CONCAT(`lastname`," ", `firstname`) AS `fio`, `housing`.id AS `housing_id`, `title` AS `housing_title`, 
`status`, DATE_FORMAT(`created_at`,"%d %M %Y") AS `created_at`, DATE_FORMAT(`arrival_date`,"%d %M %Y") AS `arrival_date`, 
DATEDIFF(`arrival_date`, `created_at`) AS `days_diff` FROM `wish_lists` INNER JOIN `orders` ON 
`wish_lists`.user_id = `orders`.user_id AND `wish_lists`.housing_id = `orders`.housing_id INNER JOIN `users` ON 
`wish_lists`.user_id = `users`.id INNER JOIN `housing` ON `wish_lists`.housing_id = `housing`.id WHERE `created_at` < `arrival_date`; 