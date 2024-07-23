/*in line view와 subquery*/

SELECT * FROM 
(SELECT COLOR, AVG(ListPrice) AS AVG_PRICE FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY COLOR ) AS TEMP_T
WHERE AVG_PRICE > 10


SELECT * FROM HumanResources.EmployeeDepartmentHistory
WHERE DepartmentID in (3,4)

SELECT * FROM HumanResources.Department
WHERE GroupName = 'Sales and Marketing'

SELECT * FROM HumanResources.EmployeeDepartmentHistory AS a, HumanResources.Department AS b
WHERE a.DepartmentID=b.DepartmentID
AND b.GroupName = 'Sales and Marketing'


