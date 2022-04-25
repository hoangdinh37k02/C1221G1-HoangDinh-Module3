create database product;
use product;

create table product(
productID int auto_increment primary key,
productName varchar(50),
price double,
quantity int,
color varchar(45),
categoryID int,
foreign key (categoryID) references category(categoryID)
);

create table category(
categoryID int auto_increment primary key,
`name` varchar(70)
);

insert into product(productName, price, quantity, color, categoryID) values('iphone 12','800','15','blue','1');
insert into product(productName, price, quantity, color, categoryID) values('LCD 12','400','15','black','2');
insert into category(categoryID, `name`) values('1','phone');
insert into category(categoryID, `name`) values('2','Ti vi');
insert into category(categoryID, `name`) values('3','Tủ lạnh');