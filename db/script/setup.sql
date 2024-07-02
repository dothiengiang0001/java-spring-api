CREATE DATABASE DB;

use DB;

create table DB.users(
id int NOT NULL AUTO_INCREMENT primary key,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NUll);

INSERT INTO DB.users(id, first_name, last_name) VALUES(1,'Apple', 'Pipe');