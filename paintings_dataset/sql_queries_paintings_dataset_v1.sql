--Creation of Tables

create table paintings
(
    id              int,
    name            varchar(40),
    artist_id       int,
    listed_price    float
);

create table artists
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table collectors
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table sales
(
    id                  int,
    sale_date           date,
    painting_id         int,
    artist_id           int,
    collector_id        int,
    sales_price         float
);

--Loading data into tables
insert into paintings values (11,'Miracle',1,300);
insert into paintings values (12,'Sunshine',1,700);
insert into paintings values (13,'Pretty woman',2,2800);
insert into paintings values (14,'Handsome man',2,2300);
insert into paintings values (15,'Barbie',3,250);
insert into paintings values (16,'Cool painting',3,5000);
insert into paintings values (17,'Black square #1000',3,50);
insert into paintings values (18,'Mountains',4,1300);

insert into artists values (1,'Thomas','Black');
insert into artists values (2,'Kate','Smith');
insert into artists values (3,'Natali','Wein');
insert into artists values (4,'Francesco','Benelli');

insert into collectors values (101,'Brandon','Cooper');
insert into collectors values (102,'Laura','Fisher');
insert into collectors values (103,'Christina','Buffet');
insert into collectors values (104,'Steve','Stevenson');

insert into sales values (1001,'2021-11-01',13,2,104,2500);
insert into sales values (1002,'2021-11-10',14,2,102,2300);
insert into sales values (1003,'2021-11-10',11,1,102,300);
insert into sales values (1004,'2021-11-15',16,3,103,4000);
insert into sales values (1005,'2021-11-22',15,3,103,200);
insert into sales values (1006,'2021-11-22',17,3,103,50);

--Displaying all the data from tables
select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

--Problems on Subqueries based on painting dataset 

--Q1) Fetch paintings that are priced higher than the average painting price?

SELECT name 
FROM paintings
WHERE listed_price > 
(SELECT avg(listed_price)
FROM paintings );

--Q2) Find all collectors who purchased paintings?
SELECT distinct concat(c.first_name,' ',c.last_name ) as name
FROM collectors c join sales s 
ON c.id = s.collector_id;

--Q3) Fetch the total amount of sales for each artist who has sold at least one painting .
-- Display artist name and total sales made by him 


SELECT  concat(a.first_name,' ',a.last_name) as name,sum(sales_price) as total_sales
FROM artists a join sales s on a.id=s.artist_id
group by  a.first_name,a.last_name;

--Q4) Find the name of the artist who has zero sales?

SELECT  concat(first_name,' ',last_name) as name
FROM artists 
WHERE id not in (select artist_id from sales);



