#esercizio 1 
select ProductKey,count(ProductKey)
from dimproduct
where ProductKey is null
group by ProductKey
having count(ProductKey) <> 1;

#esercizio 2
select SalesOrderNumber,SalesOrderLineNumber,count(SalesOrderNumber) as x,count(SalesOrderNumber)as y
from factresellersales
where SalesOrderNumber is not null or SalesOrderLineNumber is not null
group by SalesOrderNumber, SalesOrderLineNumber
having count(SalesOrderNumber) <> 1 or count(SalesOrderNumber) <> 1;

#esercizio 3
select OrderDate, count(SalesOrderLineNumber) as "Numero Transazioni"
from factresellersales
where OrderDate >="2020-01-01"
group by OrderDate;

#esercizio 4
select EnglishProductName as "Nome Prodotto", sum(SalesAmount) as "Fatturato totale", sum(OrderQuantity) as "Quantità totale venduta", avg(UnitPrice) as "Prezzo medio di vendita"
from factresellersales
inner join dimproduct
on factresellersales.ProductKey = dimproduct.ProductKey
where OrderDate >= "2020-01-01"
group by EnglishProductName;

#esercizio 1_2
select sum(SalesAmount) as "Fatturato Totale",sum(OrderQuantity) as "Quantità Totale Venduta",EnglishProductCategoryName as"Categoria Prodotto"
from factresellersales
inner join dimproduct
on factresellersales.ProductKey = dimproduct.ProductKey
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
group by EnglishProductCategoryName;

#esercizio 1_2 
select City as "Città",sum(SalesAmount) as "fatturato Totale",OrderDate
from factresellersales
inner join dimgeography
on factresellersales.SalesTerritoryKey = dimgeography.SalesTerritoryKey
where OrderDate >="2020-01-01"
group by City
having sum(SalesAmount)>"600000"
order by sum(SalesAmount) asc;