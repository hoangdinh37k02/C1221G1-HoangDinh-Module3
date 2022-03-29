create database demo;
use demo;
create table demo.mobile(
mobile_id int auto_increment,
mobile_name varchar(30),
mobile_price double,
primary key (mobile_id)
);

insert into demo.mobile(mobile_name, mobile_price) value("redmi7", 220),("iphoneX",550),("nokia1200",30);
insert into demo.mobile(mobile_name, mobile_price) value("redmi7", 220);

alter table demo.mobile add manufacture varchar(40);

set sql_safe_updates = 0;
update demo.mobile set manufacture = "foreign";
set sql_safe_updates = 1;

select mobile_name,mobile_price from demo.mobile;

delete from demo.mobile where mobile_id=1;

update demo.mobile set manufacture = "USA" where mobile_id = 4;