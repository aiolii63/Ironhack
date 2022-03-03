create database lab_mysql;

use lab_mysql;

create table cars (car_ID integer primary key, VIN char(17), OEM VARCHAR(15), MODEL VARCHAR(30), YEAR integer, COLOR VARCHAR(15));
create table sales (STAFF_ID integer Primary Key, Name VARCHAR(15), Store_ID VARCHAR(15));
create table customers (CustID integer primary key, Name VARCHAR(15), phone bigint, email VARCHAR(30), address varchar(50), city varchar(10), state varchar(15), country CHAR(3), ZIP integer);
create table invoices (invoice_id varchar(15) primary key, inv_date date, car_id integer, cust_id integer, sales_name varchar(15));
 
select * from cars;
select * from sales;
select * from customers;
select * from invoices;

insert into invoices (InvoiceID, InvDate, car_ID, CustID, SalesName)
values ("FRA202202211234", "2022-02-21", 124, 10001, "Petey Cruiser");

insert into sales (STAFF_ID, Name, Store_ID)
values (00001, "Petey Cruiser", "Madrid"),(00002, "Anna Sthesia", "Barcelona"),(00003,"Paul Molive","Berlin"),(00004, "Gail Forcewind","Paris"),(00005, "Paige Turner","Mimia"),(00006, "Bob Frapples", "Mexico City"),(00007, "Walter Melon", "Amsterdam"),(00008, "Shonda Leer", "São Paulo");

insert into invoices (InvoiceID, InvDate, car_ID, CustID, SalesName)
values ("852399038", "2018-08-22", 0, 1, 3), ("731166526", "2018-12-31", 3, 0, 5), ("271135104","2019-01-22", 2, 2, 7);

INSERT INTO cars VALUES(0,'3K096I98581DHSNUP', 'Volkswagen','Tiguan', '2019', 'Blue'),
(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',	2019 ,'Red'),
(2,'RKXVNNIHLVVZOUB4M' ,'Ford', 'Fusion', 2018 ,'White'),
(3,'HKNDGS7CU31E9Z7JW','Toyota', 'RAV4',2018,'Silver'),
(4,'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019 ,	'Gray'),
(5,'DAM41UDN3CHU2WVF6', 'Volvo' ,'V60 Cross Country', 2019,'Gray');

insert into customers values (10001,"PabloPic",34636176382,"-","Paseo de la Chopera, 14", "Madrid","Madrid","Spa",28045),
(20001,"AbrahamL", 13059077086,"-","120 SW 8th St","Miami","Florida","Usa",33130),
(30001,"NapoléonB",33179754000,"-","40 Rue du Colisée", "Paris","Île-de-France","Fra",75008);

DELETE FROM invoices
WHERE SalesName="Petey Cruiser";

update sales
set store_ID="Miami"
where store_ID="Mimia";

update customers
set email="ppicasso@gmail.com"
where Name="PabloPic";

update customers
set email="lincoln@us.gov"
where Name="AbrahamL";

update customers
set email="hello@napoleon.me"
where Name="NapoléonB";

delete from cars
where car_ID=4;