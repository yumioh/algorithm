/*집계처리*/
SELECT Gender, COUNT(Gender) as CNT FROM HumanResources.Employee GROUP BY Gender

SELECT VendorID, COUNT(VendorID) AS CNT FROM Purchasing.PurchaseOrderHeader
WHERE VendorID >= 1500
GROUP BY VendorID
ORDER BY VendorID DESC

SELECT DATEPART(YY,OrderDate) AS A_Y, COUNT(DATEPART(YY,OrderDate)) AS CNT  FROM Purchasing.PurchaseOrderHeader
GROUP BY DATEPART(YY,OrderDate)
ORDER BY DATEPART(YY,OrderDate) DESC

SELECT Color, AVG(ListPrice) AS average FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color
Having AVG(ListPrice) >= 500


SELECT TOP 100 CustomerID, COUNT(CustomerID) AS CC, SUM(TotalDue) AS SUM 
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY SUM(TotalDue) DESC


