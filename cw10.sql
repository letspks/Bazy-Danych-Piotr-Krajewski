--1

SELECT * FROM Production.Product where ProductID = 707
BEGIN TRANSACTION
UPDATE Production.Product SET ListPrice = ListPrice*1.1 WHERE ProductID = 680;
COMMIT
SELECT * FROM Production.Product where ProductID = 680

--2
BEGIN TRANSACTION
DELETE FROM Production.Product WHERE ProductID = 707
EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL"
PRINT 'Wykonano usuniecie produktu 707'
ROLLBACK TRANSACTION;
SELECT * FROM Production.Product

--3
BEGIN TRANSACTION;
INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate)
VALUES ('Czapka','CZ-1234',0,0, 'Niebieska',1000,750, 12.50, 17.50,0,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
COMMIT TRANSACTION;

--4
BEGIN TRANSACTION;
IF (SELECT 1.1*SUM(StandardCost) FROM Production.Product) <= 50000
BEGIN
    UPDATE Production.Product SET StandardCost = StandardCost * 1.10;
    COMMIT TRANSACTION;
    PRINT 'Nie przekroczono 50000, zatwierdzam transakcje';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Przekroczono 50000, nie zatwierdzam transakcji';
END

--5
BEGIN TRANSACTION
IF EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = 'CZ-1236')
BEGIN
	PRINT 'Jest juz taki produkt, wycofuje transakcje'
	ROLLBACK TRANSACTION;
END
ELSE
BEGIN
	INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate)
	VALUES ('Czapka1','CZ-1236',0,0, 'Niebieska',1000,750, 12.50, 17.50,0,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
	PRINT 'Dodaje produkt'
	COMMIT TRANSACTION;
END;


SELECT * FROM Production.Product

--6
BEGIN TRANSACTION;
IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Jest taki SalesOrderDetail gdzie OrderQty to 0';
END
ELSE
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty+1;
    COMMIT TRANSACTION;
    PRINT 'Przepuszczam transakcje';
END

SELECT * FROM Sales.SalesOrderDetail

--7
BEGIN TRANSACTION;
DELETE FROM Production.Product WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);
IF @@ROWCOUNT > 10
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Proba usuniecia wiecej niz 10 rekordow, anuluje transakcje';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Usuwam mniej niz/rowne  10 rekordow, akceptuje transakcje';
END
