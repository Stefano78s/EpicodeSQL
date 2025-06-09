# esercizio 1
select EnglishProductName as "Nome Prodotto",EnglishProductSubcategoryName as "Sotto Categoria"
from dimproduct
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey;

# esercizio 2
select EnglishProductName as "Nome Prodotto",EnglishProductSubcategoryName as "Sotto Categoria",EnglishProductCategoryName as "Categoria"
from dimproduct
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey;

# esercizio 3 da rivedere inner (a:b)
select EnglishProductName as "nome prodotto",OrderQuantity as Q_Prodotti ,SalesOrderNumber
from factresellersales
left join dimproduct
on factresellersales.ProductKey = dimproduct.ProductKey;


# esercizio 4 subquery
select EnglishProductName as "nome prodotto",ProductKey
from dimproduct
where FinishedGoodsFlag = 1
and ProductKey not in (
select ProductKey
from factresellersales
);


#esercizio 5
select SalesOrderNumber as "Numero Ordine",SalesAmount as "costo",OrderQuantity as "quantità",EnglishProductName as "nome prodotto"
from factresellersales
inner join dimproduct
on factresellersales.ProductKey = dimproduct.ProductKey;

#esercio 1_1
select EnglishProductName,SalesOrderNumber,EnglishProductCategoryName, OrderDate, OrderQuantity
from factresellersales
inner join dimproduct 
on factresellersales.ProductKey = dimproduct.ProductKey
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
group by EnglishProductName, OrderDate
having EnglishProductCategoryName = "Clothing"
order by OrderDate asc;

#esercizio 1_2
select*
from dimreseller;
select*
from dimgeography;

#esercizio 1_3
select ResellerKey,ResellerName,EnglishCountryRegionName,StateProvinceName
from dimreseller
inner join dimgeography
on dimreseller.GeographyKey = dimgeography.GeographyKey;

#esercizio 1_4
SELECT SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, OrderQuantity, TotalProductCost, EnglishProductName, EnglishProductCategoryName, ResellerName, EnglishCountryRegionName
FROM dimgeography JOIN dimreseller
ON dimgeography.GeographyKey = dimreseller.GeographyKey
JOIN factresellersales
ON dimgeography.SalesTerritoryKey = factresellersales.SalesTerritoryKey
JOIN dimproduct
ON factresellersales.ProductKey = dimproduct.ProductKey
JOIN dimproductsubcategory
ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
JOIN dimproductcategory
ON dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
WHERE TotalProductCost IS NOT NULL
ORDER BY OrderDate ASC;
