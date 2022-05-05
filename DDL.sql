DROP DATABASE IF EXISTS `airbnb`;
CREATE DATABASE `airbnb`;
USE `airbnb`;

# Таблица users содержит общую информацию о пользователях платформы.
# Не содержит индексов, потому что на платформе таргетом является поиск жилья, а не людей. 
# В профилях для остальных пользователей отображается только никнейм.
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`id` SERIAL PRIMARY KEY, 
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50),
    `email` VARCHAR(120) UNIQUE,
 	`password_hash` VARCHAR(100), 
	`phone` BIGINT UNSIGNED UNIQUE
);

# Таблица photos содержит информацию о фотографиях, сохраненных на сервере
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos`(
	`id` SERIAL PRIMARY KEY,
  	`body` TEXT COMMENT "Описание фото",
    `filename` VARCHAR(255),
    `size` INT,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP
);

# Таблица languages содержит список языков.
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  	`title` VARCHAR(25) NOT NULL UNIQUE
);

# Таблица currency содержит используемые на платформе валюты.
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  	`title` VARCHAR(50) NOT NULL UNIQUE COMMENT "Полное наименование",
    `abbreviation` VARCHAR(10) UNIQUE COMMENT "Сокращённое наименование",
	`sign` VARCHAR(5) UNIQUE COMMENT "Знак валюты"
);

# Таблица payment_methods содержит способы оплаты, указанные пользователями.
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`(
  	`id` SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `card_number` BIGINT UNSIGNED NOT NULL,
    `expiry_date` DATE NOT NULL,
    `cvv` INT(3) UNSIGNED NOT NULL,
    `index` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

# Таблица profiles содержит полную информацию о профилях пользователях.
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	`user_id` BIGINT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
    `nickname` VARCHAR(50),
    `description` TEXT COMMENT "Описание профиля",
    `gender` ENUM("f", "m", "unknown"),
    `birthday` DATE,
	`photo_id` BIGINT UNSIGNED NOT NULL,
    `country` VARCHAR(100),
    `hometown` VARCHAR(100),
    `current_payment_method_id` BIGINT UNSIGNED NOT NULL,
    `currency_id` INT UNSIGNED NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    INDEX `profiles_nickname_idx`(`nickname`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`photo_id`) REFERENCES `photos`(`id`),
    FOREIGN KEY (`currency_id`) REFERENCES `currency`(`id`),
    FOREIGN KEY (`current_payment_method_id`) REFERENCES `payment_methods`(`id`)
);

# Таблица users_languages содержит информацию о языках, которыми владеет пользователь.
DROP TABLE IF EXISTS `users_languages`;
CREATE TABLE `users_languages`(
  	`user_id` BIGINT UNSIGNED NOT NULL,
    `language_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`user_id`, `language_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`language_id`) REFERENCES `languages`(`id`)
);

# Таблица housing_types содержит типы жилья. 
DROP TABLE IF EXISTS `housing_types`;
CREATE TABLE `housing_types`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  	`title` VARCHAR(50) NOT NULL UNIQUE
);

# Таблица housing содержит общую информацию о предлагаемом жилье.
DROP TABLE IF EXISTS `housing`;
CREATE TABLE `housing`(
	`id` SERIAL PRIMARY KEY,
	`user_id` BIGINT UNSIGNED NOT NULL,
    `housing_type_id` INT UNSIGNED NOT NULL,
	`title` VARCHAR(50) NOT NULL UNIQUE,
	`location_country` VARCHAR(20) NOT NULL, 
	`location_city` VARCHAR(20) NOT NULL, 
	`address` VARCHAR(50) NOT NULL UNIQUE,
	`user_greeting` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	`price_per_day` FLOAT(6, 2) NOT NULL COMMENT "Стоимость указывается в долларах США",
	`guests_max_quantity` INT(3) NOT NULL,
	`beds_quantity` INT(3) NOT NULL,
	`bedrooms_quantity` INT(3) NOT NULL,
	`bathroom_quantity` INT(3) NOT NULL,
	`arrival_after` TIME NOT NULL,
	`departure_before` TIME NOT NULL,
	`housing_rules` TEXT NOT NULL,
    INDEX `housing_location_city_idx`(`location_city`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`housing_type_id`) REFERENCES `housing_types`(`id`)
);

# Таблица housing_photos содержит данные о закрепленных за жильём фотографиях. 
DROP TABLE IF EXISTS `housing_photos`;
CREATE TABLE `housing_photos`(
	`id` SERIAL PRIMARY KEY,
    `photo_id` BIGINT UNSIGNED NOT NULL,
    `housing_id` BIGINT UNSIGNED NOT NULL,
    `category` VARCHAR(20) NOT NULL DEFAULT "Additional photos",
    FOREIGN KEY (`photo_id`) REFERENCES `photos`(`id`),
    FOREIGN KEY (`housing_id`) REFERENCES `housing`(`id`)
);

# Таблица characteristics_list содержит список характестик для описания жилья.
DROP TABLE IF EXISTS `characteristics_list`;
CREATE TABLE `characteristics_list`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  	`title` VARCHAR(50) NOT NULL UNIQUE
);

# Таблица living_comfort_types хранит список возможных удобств. 
DROP TABLE IF EXISTS `living_comfort_types`;
CREATE TABLE `living_comfort_types`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  	`title` VARCHAR(100) NOT NULL UNIQUE,
    `characteristics_list_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`characteristics_list_id`) REFERENCES `characteristics_list`(`id`)
);

# Таблица living_comfort содержит данные об удобствах, относящихся к определённому жилью.
DROP TABLE IF EXISTS `living_comfort`;
CREATE TABLE `living_comfort`(
  	`housing_id` BIGINT UNSIGNED NOT NULL,
    `living_comfort_type_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`housing_id`, `living_comfort_type_id`),
    FOREIGN KEY (`housing_id`) REFERENCES `housing`(`id`),
    FOREIGN KEY (`living_comfort_type_id`) REFERENCES `living_comfort_types`(`id`)
);

# Таблица orders содержит информацию о заказах, оформленных через платформу.
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`(
	`id` SERIAL PRIMARY KEY,
	`housing_id` BIGINT UNSIGNED NOT NULL,
	`user_id` BIGINT UNSIGNED NOT NULL,
	`guests_quantity` INT(3) NOT NULL,
	`arrival_date` DATE NOT NULL,
	`departure_date` DATE NOT NULL,
	`day_quantity` INT(3) NOT NULL,
	`total_price_without_bonus` FLOAT(6, 2) NOT NULL,
    `total_price` FLOAT(6, 2) NOT NULL,
	`status` ENUM("Забронирован", "Оплачен частично", "Оплачен полностью", "Отменён"),
	`paid_amount` FLOAT(7, 3) NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`housing_id`) REFERENCES `housing`(`id`)
);

# Таблица messages содержит данные о чате между пользователями.
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
	`id` SERIAL PRIMARY KEY,
	`from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `body` TEXT,
    `created_at` DATETIME DEFAULT NOW(),
    FOREIGN KEY (`from_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`to_user_id`) REFERENCES `users`(`id`),
    CHECK (`from_user_id` <> `to_user_id`)
);

# Таблица wish_lists содержит информацию о сохраненных в закладках жильях пользователями.
DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE `wish_lists`(
	`id` SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `housing_id` BIGINT UNSIGNED NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`housing_id`) REFERENCES `housing`(`id`)
);

# Таблица reviews содержит данные об отзывах.
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`(
	`id` SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `order_id` BIGINT UNSIGNED NOT NULL,
	`body` TEXT NOT NULL,
    `score` INT CHECK(`score` = 1 OR `score` = 2 OR `score` = 3 OR `score` = 4 OR `score` = 5),
    `created_at` DATETIME DEFAULT NOW(),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`)
);

# Таблица bonuses содержит информацию о бонусах, полученных пользователями.
DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE `bonuses`(
	`id` SERIAL PRIMARY KEY,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `status` BOOL DEFAULT FALSE,
	`bonus_amount` FLOAT(6, 2) NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`)
);