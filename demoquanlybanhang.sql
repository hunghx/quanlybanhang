create database quanlybanhang_demo;
use quanlybanhang_demo;

create table Category (
id int auto_increment primary key,
name varchar(255) not null,
createDate datetime default now(),
status tinyint default 1
);

create table Product (
id int auto_increment primary key,
name varchar(255) not null ,
price float,
image text,
quantity int check(quantity>=0),
title text,
createdDate datetime default now(),
category_id int references Category(id),
status tinyint default 1
);

Create table Address(
id int auto_increment primary key,
`add` varchar(255) not null,
nameReceiver varchar(255),
phoneNumber varchar(100) not null
);

create table `User`(
id int auto_increment primary key,
fullname varchar(255),
username varchar(255) not null unique,
password varchar(255) not null ,
role tinyint default 1,
status tinyint default 1,
address_id int references Address(id)
);

create table `Order`
(
id int auto_increment primary key,
user_id int not null references `User`(id),
total float ,
createdDate datetime default now(),
status tinyint default 1,
`type` tinyint default 1
)	;


create table Order_detail(
id int auto_increment primary key,
order_id int not null references `order`(id),
product_id int references product(id),
productName varchar(255),
productPrice float,
quantity int check (quantity>0)
);

insert into category(name) values
("Quần"),("Áo"),("Mũ"),("Giày dép"),("Trang Sức");
select * from category;



insert into address(`add`,nameReceiver,phoneNumber) values
("Hà nội", "Nguyễn văn A","0987736533"),
("Hà Nam", "Nguyễn văn B","09877362333"),
("Nghệ An", "Nguyễn văn C","0987474533"),
("Bến Che", "Nguyễn văn D","0987982333");
select * from address;

insert into user(fullname,username,password,address_id) values
("Xuân Hùng","hunghx","123456",1),
("Tuân Anh","anhht","123456",2),
("Đức Minh","minhkun","123456",3),
("Thị Ngân","ngantx","123456",4);
select * from user;

insert into `order`(user_id) values
(1),(1),(2),(2),(3),(5),(4);
select* from `order`;

insert into product(name,price,quantity,category_id) values
("Quần âu nam",150000,100,1),
("Quần jean",350000,200,1),
("Áo dài",550000,100,2),
("Mũ lưỡi trai",200000,100,3),
("Áo dạ nữ",650000,150,2),
("Áo sơ mi",250000,100,2),
("Mũ bảo hiểm",450000,100,3),
("Giày nike",950000,100,4),
("Nhẫn kim cương",11150000,100,5),
("Giày addidas",2150000,100,4);
select * from product;
insert into order_detail(order_id,product_id,productName,productPrice,quantity) values
(1,1,"Quần âu nam",150000,2),
(1,3,"Áo dài",550000,5),
(1,4,"Mũ lưỡi trai",200000,10),
(2,1,"Quần âu nam",150000,4),
(2,5,"Áo dạ nữ",650000,1),
(2,7,"Mũ bảo hiểm",450000,5),
(3,1,"Quần âu nam",150000,6),
(3,8,"Giày nike",950000,3),
(3,10,"Giày addidas",2150000,2),
(3,9,"Nhẫn kim cương",11150000,5),
(4,1,"Quần âu nam",150000,6),
(4,3,"Áo dài",550000,2),
(4,5,"Áo dạ nữ",650000,3),
(5,1,"Quần âu nam",150000,1),
(5,3,"Áo dài",550000,6),
(5,4,"Mũ lưỡi trai",200000,8),
(6,5,"Áo dạ nữ",650000,9),
(6,2,"Quần jean",350000,7),
(6,1,"Quần âu nam",150000,4),
(7,2,"Quần jean",350000,3),
(7,3,"Áo dài",550000,2),
(7,6,"Áo sơ mi",250000,5);
select o.order_id,sum(o.productPrice*o.quantity) from order_detail o group by order_id;
