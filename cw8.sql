--zad1 cte

--select * from HumanResources.EmployeePayHistory
--select * from Person.Person
WITH cte1 (BusinessEntityID,FirstName,MiddleName,LastName,Rate)
AS(
SELECT Person.Person.BusinessEntityID,FirstName,MiddleName,LastName,Rate from Person.Person
INNER JOIN HumanResources.EmployeePayHistory ON Person.Person.BusinessEntityID=HumanResources.EmployeePayHistory.BusinessEntityID
)

SELECT * INTO #InformacjaOWyplatachPracownikav2 FROM cte1;
SELECT * FROM #InformacjaOWyplatachPracownikav2

--zad2
select * from SalesLT.SalesOrderHeader

WITH cte2 (Kontakt, Obrot) AS(
	SELECT concat(CompanyName, '(', FirstName, '    ', LastName, ')') AS Kontakt, TotalDue AS Obrot 
	FROM SalesLT.Customer AS customer
	INNER JOIN SalesLT.SalesOrderHeader AS header
	ON customer.CustomerID = header.CustomerID)
SELECT * FROM cte2
ORDER BY Kontakt;

--zad3


WITH CTE3 (Kategoria, Obrot) AS (
SELECT kateg.Name AS Kategoria, ROUND(LineTotal, 2) AS Obrot FROM SalesLT.Product AS produkt
INNER JOIN SalesLT.ProductCategory AS kateg
ON produkt.ProductCategoryID = kateg.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail AS detal
ON produkt.ProductID = detal.ProductID)
SELECT Kategoria, CAST(ROUND(SUM(Obrot),2) AS DECIMAL (10,2)) AS Obrot FROM CTE3
GROUP BY Kategoria ORDER BY Kategoria;
