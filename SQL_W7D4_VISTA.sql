select EnglishProductName as "Nome Prodotto", EnglishProductSubcategoryName as "Sottocategoria Prodotto", EnglishProductCategoryName as "Categoria Prodotto"
from dimproduct
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey;

# VISTA  Product
create view Product as (
select EnglishProductName as "Nome Prodotto", EnglishProductSubcategoryName as "Sottocategoria Prodotto", EnglishProductCategoryName as "Categoria Prodotto"
from dimproduct
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
);

alter view Product as(
select dimproduct.ProductKey, dimproductsubcategory.ProductSubcategoryKey, dimproductcategory.ProductCategoryKey, EnglishProductName as "Nome Prodotto", EnglishProductSubcategoryName as "Sottocategoria Prodotto", EnglishProductCategoryName as "Categoria Prodotto"
from dimproduct
inner join dimproductsubcategory
on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
);


select * from Product;

#esercizio 2
select ResellerName as "Nome Reseller", City as "Città",EnglishCountryRegionName as "Regione"
from dimreseller
inner join dimgeography
on dimreseller.GeographyKey = dimgeography.GeographyKey;

# VISTA   Reseller
create view Reseller as (
select dimreseller.ResellerKey, dimgeography.GeographyKey, ResellerName as "Nome Reseller", City as "Città",EnglishCountryRegionName as "Regione"
from dimreseller
inner join dimgeography
on dimreseller.GeographyKey = dimgeography.GeographyKey
);

alter view Reseller as (
select dimreseller.ResellerKey, dimgeography.GeographyKey, ResellerName as "Nome Reseller", City as "Città",EnglishCountryRegionName as "Regione"
from dimreseller
inner join dimgeography
on dimreseller.GeographyKey = dimgeography.GeographyKey
);

select * from Reseller;


#esercizio 3
select OrderDate as "Data Ordine", SalesOrderNumber as "Codice Documento", SalesOrderLineNumber as "riga di corpo del documento", OrderQuantity as "Quantità Prodotto", SalesAmount as "Importo Totale",(SalesAmount-TotalProductCost) as "Profitto"
from factresellersales;

# VISTA Sales
create view Sales as (
select OrderDate as "Data Ordine", SalesOrderNumber as "Codice Documento", SalesOrderLineNumber as "Riga di corpo del documento", OrderQuantity as "Quantità Prodotto", SalesAmount as "Importo Totale",(SalesAmount-TotalProductCost) as "Profitto"
from factresellersales
);

select * from Sales;

alter view Sales as (
select factresellersales.ProductKey, factresellersales.SalesOrderNumber, factresellersales.ResellerKey, OrderDate as "Data Ordine", SalesOrderNumber as "Codice Documento", SalesOrderLineNumber as "Riga di corpo del documento", OrderQuantity as "Quantità Prodotto", SalesAmount as "Importo Totale",(SalesAmount-TotalProductCost) as "Profitto"
from factresellersales
);