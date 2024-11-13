DROP TABLE IF EXISTS `stations_name`;
DROP TABLE IF EXISTS `train_types`;
DROP TABLE IF EXISTS `trains_time`;
DROP TABLE IF EXISTS `train_users`;
DROP TABLE IF EXISTS `train_tickets`;
 
 
 CREATE TABLE `stations_name` (
 `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(20) NOT NULL
 ) ENGINE=InnoDB;

 CREATE TABLE `train_types` (
 `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(20) NOT NULL,
 `max_seats` VARCHAR(20) NOT NULL,
 `fare_rate` INT NOT NULL
 ) ENGINE=InnoDB;

 CREATE TABLE `trains_time` (
 `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `type` INT NOT NULL,
 `source` INT NOT NULL,
 `destination` INT NOT NULL,
 `departure` TIME NOT NULL,
 `arrival` TIME NOT NULL,
 `distance` INT NOT NULL,
 FOREIGN KEY (`type`) REFERENCES `train_types`(`id`) ON DELETE CASCADE,
 FOREIGN KEY (`source`) REFERENCES `stations_name`(`id`) ON DELETE CASCADE,
 FOREIGN KEY (`destination`) REFERENCES `stations_name`(`id`) ON DELETE CASCADE
 ) ENGINE=InnoDB;

 CREATE TABLE `train_users` (
 `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(20) NOT NULL
 ) ENGINE=InnoDB;

 CREATE TABLE `train_tickets` (
 `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `train` INT NOT NULL,
 `user` INT NOT NULL,
 `seat_number` INT NOT NULL,
 FOREIGN KEY (`train`) REFERENCES `trains_time`(`id`) ON DELETE CASCADE,
 FOREIGN KEY (`user`) REFERENCES `train_users`(`id`) ON DELETE CASCADE,
 UNIQUE (`train`, `seat_number`)
 ) ENGINE=InnoDB;