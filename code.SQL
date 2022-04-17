create database store;
use store;
create table countries (
code int primary key, name varchar(20) not null,continent_name  varchar(20) unique );

create table user (
id int primary key, full_name varchar(20),email varchar(20) unique, gender char(1) check(gender in ('m'or'f')),
date_of_birth varchar(15),crated_at datetime, country_cod int,
foreign key (country_cod) references countries (code)
)
 create table orders (
id int primary key, user_id int,status varchar(6) check(status in ('start'or'finish')), crated_at datetime,
foreign key (user_id) references user (id)
)

create table order_products (order_id int ,product_id int , quantity int default 0,
primary key (order_id,product_id),
foreign key (order_id) references orders(id),foreign key (product_id) references product(id)
);
create table products(
id int primary key, name varchar(10) not null , price int default 0, status varchar(10)  check(status in ('valid'or'expired')),
created_at datetime
) ;
insert into countries value (1111,'ksa','ksa'),(2222,'iraq','iraq');
insert into user value (2155,'omar','omar@gmail.com','m','1999-02-18','2022-04-17',1111);
insert into orders value (9999,2155,'start','2022-04-17');
insert into products value (7777,'shirt',55,'valid','2022-04-17');
insert into order_products value (9999,7777,0);
update  countries set name = 'egypt' where code = 2222;
delete from order_products where order_id = 9999;
