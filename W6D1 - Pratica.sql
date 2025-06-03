SELECT ProductKey as "Chiave Prodotto", ProductAlternateKey as "Codice Modello", EnglishProductName as "Nome Prodotto", Color as "Colore", StandardCost as "Costo Standard", FinishedGoodsFlag as "Indicatore Prodotto Terminato",ListPrice as "Prezzo di Listino",(ListPrice - StandardCost) as Markup
FROM dimproduct
where FinishedGoodsFlag > 0 and ProductAlternateKey like 'FR%' or ProductAlternateKey LIKE 'BK%'
and ListPrice BETWEEN 1000 and 2000;

select LastName as "Cognome",FirstName as "Nome",SalespersonFlag
from dimemployee
where SalespersonFlag = 1;


select ResellerKey,SalesAmount,TotalProductCost,(SalesAmount-TotalProductCost) as "Profitto",OrderDate,SalesOrderNumber,ProductKey
from factresellersales
where ProductKey in (597,598,477,214) and OrderDate >= "2020-01-01"
order by OrderDate asc;

SHOW DATABASES;

SHOW TABLES;

