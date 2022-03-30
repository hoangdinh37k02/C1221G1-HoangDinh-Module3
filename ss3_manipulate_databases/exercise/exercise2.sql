use quan_ly_khach_hang;
insert into customer(customer_name,customer_age) value
("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);

insert into `order`(customer_id, order_date, total_price) value
(1,"2006-03-21",Null),
(2,"2006-03-23",Null),
(1,"2006-03-16",Null);

insert into product(product_name,product_price) value
("May Giat",3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat",1),
("Bep Dien",2);

insert into order_detail(order_id,product_id,order_quantity) value
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select `order`.order_id, `order`.order_date, `order`.total_price from `order`;
select customer.customer_id, customer.customer_name, product.product_name, `order`.order_date
from customer join `order` on  customer.customer_id = `order`.customer_id
join order_detail on `order`.order_id=order_detail.order_id
join product on order_detail.product_id=product.product_id;

select customer.customer_id, customer.customer_name from customer left join `order` on  customer.customer_id = `order`.customer_id 
where `order`.order_id is null;

select order_detail.order_id, `order`.order_date, sum(product.product_price*order_detail.order_quantity) as total
from `order` join order_detail on `order`.order_id=order_detail.order_id
 join product on order_detail.product_id=product.product_id
group by `order`.order_id;





