create database auth;

use auth;
create table user(
user_id int NOT NULL AUTO_INCREMENT, 
username varchar(40) not null,
 last_name varchar(40),
 country varchar(40), 
 email_id varchar(60),
 first_name varchar(40), 
 password text,
 algotithm varchar(45),
 primary key (user_id)
 );
 
 create database tours;
 
 use tours;
 
create table tour_details(
tour_id int NOT NULL AUTO_INCREMENT,
tour_name varchar(45),
created_on timestamp,
starts_on timestamp,
ends_on timestamp,
created_by int,
primary key(tour_id),
FOREIGN KEY(created_by) REFERENCES auth.user(user_id)
);


create table tour_mapping(
mapping_id int NOT NULL AUTO_INCREMENT,
tour_id int,
user_id int,
added_on timestamp,
primary key(mapping_id),
FOREIGN KEY(user_id) REFERENCES auth.user(user_id),
FOREIGN KEY(tour_id) REFERENCES tour_details(tour_id)
);

CREATE DATABASE expense;

use expense;

create table expense_details(
expense_id int AUTO_INCREMENT ,
category varchar(45),
tour_id int,
created_by varchar(45),
paid_by varchar(45),
amount int,
currency varchar(3),
PRIMARY KEY(expense_id),
FOREIGN KEY(tour_id) REFERENCES tours.tour_details(tour_id)
);

create table txn_details(
txn_id int AUTO_INCREMENT,
expense_id int not null,
current_status varchar(10) not null,
created_for varchar(45) not null,
created_on timestamp,
updated_on timestamp,
is_personal boolean,
amount int,
remaining int,
PRIMARY KEY(txn_id) ,
FOREIGN KEY(expense_id) REFERENCES expense_details(tour_id)
);


create table txn_details_log(
txn_id int,
sl_no int,
last_updated timestamp,
amount  int,
currency varchar(3),
txn_type varchar(10),
FOREIGN KEY(txn_id) REFERENCES txn_details(txn_id)
);



