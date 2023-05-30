--1
CREATE FUNCTION dbo.fibbo(@n INT)
RETURNS @wynik TABLE(wyniki INT)
AS
BEGIN
	DECLARE
	@bufor INT=0,
	@a INT=0,
	@b INT=1,
	@i INT=2
	WHILE(@i<=@n+1)
		BEGIN
		SET @bufor=@a+@b
		SET @b=@a
		SET @a=@bufor
		SET @i=@i+1
		INSERT INTO @wynik VALUES(@a)
		END
	RETURN
END;

CREATE or ALTER PROCEDURE fibbonacci(@x INT)
AS
BEGIN
SELECT * FROM dbo.fibbo(@x)
END;

EXECUTE fibbonacci 46;
--46 to max tak przy okazji, wiecej int nie obsluzy
--
--
--
--
--
--
--
--
--
--2
GO
CREATE TRIGGER tr_Person_ForINSERT
	ON Person.Person
	AFTER INSERT
	AS
		BEGIN
			UPDATE Person.Person
			SET LAStName = UPPER(LAStName)
			WHERE Person.BusinessEntityID IN (SELECT BusinessEntityID FROM INSERTed);
		END
GO
INSERT INTO Person.BusinessEntity (rowguid) VALUES (NEWID());
INSERT INTO Person.Person(BusinessEntityID,PersonType,FirstName,LastName,MiddleName) VALUES (20780, 'IN','Maria','Nowak','Celina');
SELECT * FROM Person.Person;
--
--
--
--3
GO
CREATE TRIGGER triggerTaxChecker
ON Sales.SalesTaxRate 
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT old.TaxRate, new.TaxRate FROM deleted AS new INNER JOIN INSERTed AS old
	ON new.TaxRate * 0.7 > old.TaxRate OR new.TaxRate * 1.3 < old.TaxRate) 
	BEGIN
	PRINT 'ERROR, TAX TO HIGH OR TO LOW!';
	END
END
GO

UPDATE Sales.SalesTaxRate SET TaxRate = TaxRate * 2;
SELECT * FROM Sales.SalesTaxRate;
