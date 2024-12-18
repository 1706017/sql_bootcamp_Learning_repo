drop table if exists Sales_order;
drop table if exists Customers;
drop table if exists Products;

create table Products
(
    product_code        varchar(20) primary key,
    PRODUCT_LINE        varchar(50),
    price               float
);


create table Customers
(
    customer_id         varchar(20) primary key,
    customer_name       varchar(100),
    phone               varchar(30),
    address             varchar(100),
    city                varchar(50),
    state               varchar(20),
    postal_code         varchar(20),
    country             varchar(30)
);


create table Sales_order
(
    order_number        bigserial primary key,
    quantity_ordered    int check (quantity_ordered > 0),
    price_each          float,
    sales               float,
    order_date          date,
    status              varchar(15),
    qtr_id              int check (qtr_id between 1 and 4),
    month_id            int check (month_id between 1 and 12),
    year_id             int,
    Product             varchar(20) references products(product_code),
    customer            varchar(20) references Customers(customer_id),
    deal_size           varchar(10) check (deal_size in ('Small', 'Medium', 'Large'))
);


alter table Sales_order add constraint chk_ord_sts
check (status in ('Cancelled', 'Disputed', 'In Process', 'On Hold', 'Resolved', 'Shipped'));