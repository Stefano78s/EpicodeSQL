CREATE database Catena_Negozi;

CREATE TABLE STORE (
	ID_STORE INT AUTO_INCREMENT primary key,
	Nome_Store VARCHAR(100),
    data_Apertura_store DATE,
    città varchar(50),
    Store_Manager varchar(50)
    );

CREATE TABLE REGION (
     ID_REGION INT AUTO_INCREMENT primary key,
     Città varchar(50),
     REGIONE varchar(50),
     AREA_GEOGRAFICA varchar(50)
     );
     
	
ALTER TABLE STORE 
ADD COLUMN ID_REGION INT;

ALTER TABLE STORE
ADD CONSTRAINT FK_StoreRegion
FOREIGN KEY (ID_REGION) REFERENCES REGION(ID_REGION);

select *
from store;

select *
from region;

describe store;
describe region;

select *
from region
inner join store
on region.ID_REGION = store.ID_REGION;

alter table store
modify Nome_Store varchar(100) not null;

alter table store
add column PIVA varchar(11) unique not null;


INSERT INTO region (Città,REGIONE,AREA_GEOGRAFICA)
values
("ROMA","LAZIO","CENTRO"),
("MILANO","LOMBARDIA","NORD"),
("NAPOLI","CAMPAGNA","SUD"),
("PALERMO","SICILIA","SUD");

select *
FROM region;

alter table store
drop column città;

insert into store (Nome_Store, data_Apertura_store, Store_Manager, ID_REGION, PIVA)
values
("GAZZA SPORT","2008-01-09","Pietro Rossi",1,"01234567891"),
("Paolo Soccer","2024-04-08","Paolo verdi",2,"01234567892"),
("PESCA IN","2000-02-04","Ettore Salvi",3,"01234567893"),
("RACING MOTOR","2017-05-05","Silvia Paciotti",4,"01234567894");

select *
FROM store;


UPDATE STORE
SET Store_Manager = "Ludovica Bonazza"
where ID_STORE = 1;

update store
set data_apertura_store = "2025-01-01"
where ID_STORE = 2;


SET SQL_SAFE_UPDATES = 0;
start transaction;

update store
set Nome_store = "pluto"
where ID_STORE = 1;

select * FROM store;

rollback;













     