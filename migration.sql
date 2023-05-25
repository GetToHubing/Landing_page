DROP database IF EXISTS pizza_db;

CREATE database IF NOT EXISTS pizza_db;

USE pizza_db;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`
(
    `id`   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255)    NOT NULL,
    `password` VARCHAR(255) NOT NULL
);