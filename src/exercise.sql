create
database exercise;
use
exercise;
create table products
(
    id                 int,
    productCode        int,
    productName        varchar(255),
    productPrice       int,
    productAmount      int,
    productDescription varchar(255),
    productStatus      varchar(255)
);

create unique index prcode on products (productCode);
create index compostiIndex on products (productName, productPrice);

explain
select productAmount
from products
where productName = 'c'
and productPrice = 13;

create view products as
    select *
from products;

create or replace view products as
select id, productPrice, productCode, productName, productAmount
from products;

update exercise.products
set id = 10
where productCode = 4;

DELIMITER //
create procedure selectall()
begin select * from products;
END //
DELIMITER ;

call selectall();

DELIMITER //
create procedure createNewProduct(id int, pcode int, name varchar(255), price int)
begin
update products set productCode = pcode, productName = namep , productPrice = price where id = idd;
END //
DELIMITER ;

call editProduct(7,15,'h',24);

DELIMITER //
create procedure deleteProduct(idd int)
begin
delete from products where id = idd;
END //
DELIMITER ;

call deleteProduct(10);
call deleteProduct(7);