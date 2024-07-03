create table worker(
    id          bigserial primary key,
    username    varchar(256) ,
    surname     varchar(256),
    birth_day   date,
    salary      int4


);

insert into worker(username,surname,salary,department) values ('Cefer','Mehtiyev',5000,'{Engineering manager}');
insert into worker(username,surname,salary,department) values ('Zaman','Eliyev',4000,'{Frontend devoloper}');
insert into worker(username,surname,salary,department) values ('Nadir','Rza',5500,'{Database manager}');
insert into worker(username,surname,salary,department) values ('Aslan','Yusubov',8800,'{Devops manager}');

select * from worker order by id desc limit 1;


select * from worker where username in ('Cefer','Zaman','Abbas');
select * from worker where username not in ('Cefer','Zaman','Abbas');

select * from worker where username like '%la%';

create table departments (
    id      bigserial primary  key ,
    departments_name    varchar(256)
);

insert into departments (departments_name) values ('IT');
insert into departments (departments_name) values ('HR');
insert into departments (departments_name) values ('Devops');

select username from worker union  select departments_name from departments;


create table company_profits(
    id              bigserial primary key ,
    company_name    varchar(256),
    year            int,
    money_turnover  decimal
)

create table countries(
    id              bigserial primary key ,
    country_name    varchar(256),
    budget          decimal
)

select count(country_name)  from countries where budget>500;

select avg(budget) from countries;

select sum(budget) from  countries;

select year,sum(money_turnover) from company_profits group by year;

select year ,sum(money_turnover) from company_profits group by year having sum(money_turnover) >3500;

create table customers(
    id               serial primary key ,
    customer_name    varchar(256),
    contact_name     varchar(256),
    country          varchar(256)
);

create table orders(
    id              serial primary key ,
    customers_id    integer references customers(id),
    orders_date            DATE
);

select o.orders_date from orders o ,customers c where  o.customers_id = c.id;

select  o.orders_date, c.customer_name,c.contact_name from orders o inner join customers c on o.customers_id = c.id;

select  o.orders_date, c.customer_name,c.contact_name from orders o left join customers c on o.customers_id = c.id;

select  o.orders_date, c.customer_name,c.contact_name from orders o right join customers c on o.customers_id = c.id;

select  o.id, c.customer_name,c.country from orders o full join customers c on o.customers_id = c.id;

select  o.id, c.customer_name from orders o cross join customers c;

create sequence next_id increment 5 start 100;

create table users(
    id              integer primary key default nextval('next_id') ,
    username        varchar(256)
);


insert into users(username) values ('cefer');