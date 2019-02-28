-- LEFT OUTER, RIGHT OUTER, FULL OUTER
SELECT * FROM JOINS.Departamentos d
INNER JOIN JOINS.Empleados e ON d.DeptID = e.DeptID



-- FULL OUTER Join pero con datos donde no coincide
SELECT * FROM JOINS.Departamentos d
FULL OUTER JOIN JOINS.Empleados e ON d.DeptID = e.DeptID
WHERE d.DeptID IS  NULL OR  e.DeptID IS  NULL



-- 2. Sacar únicos DEPT
SELECT DISTINCT d.DeptID FROM JOINS.Departamentos d
INNER JOIN JOINS.Empleados e ON d.DeptID = e.DeptID


-- lo mismo que 2. Los Dept únicos que tienen empleados
SELECT DeptID FROM JOINS.Departamentos
INTERSECT
SELECT DeptID FROM JOINS.Empleados 
-- lo opuesto que 2. Los Dept únicos que NO tengan Empleados
SELECT DeptID FROM JOINS.Departamentos
EXCEPT
SELECT DeptID FROM JOINS.Empleados 




-- Ejercicios de clase [AdventureWorksLT2008]
SELECT * FROM [SalesLT].[SalesOrderHeader] as h
INNER JOIN [SalesLT].[SalesOrderDetail] d ON h.SalesOrderID = d.SalesOrderID
WHERE h.SalesOrderID = 71774


-- Actividad 2 de consultas avanzadas [AdventureWorksLT2008]
-- 1
SELECT h.SalesOrderID, OrderDate, CustomerID, d.ProductID, d.UnitPrice, d.LineTotal, p.Name, p.ProductNumber 
FROM [SalesLT].[SalesOrderHeader] as h
INNER JOIN [SalesLT].[SalesOrderDetail] d ON h.SalesOrderID = d.SalesOrderID
	INNER JOIN [SalesLT].[Product] p ON d.ProductID = p.ProductID
WHERE h.SalesOrderID = 71885

--2 Con cliente
SELECT c.CustomerID, c.FirstName, c.LastName, h.SalesOrderID, OrderDate, d.ProductID, d.UnitPrice, d.OrderQty, d.LineTotal, p.Name, p.ProductNumber 
FROM [SalesLT].[Customer] c INNER JOIN [SalesLT].[SalesOrderHeader] as h ON c.CustomerID =  h.CustomerID
	INNER JOIN [SalesLT].[SalesOrderDetail] d ON h.SalesOrderID = d.SalesOrderID
		INNER JOIN [SalesLT].[Product] p ON d.ProductID = p.ProductID
WHERE h.SalesOrderID = 71885



--3
SELECT SalesOrderID,  SUM(LineTotal) AS TotalPedido
FROM  [SalesLT].[SalesOrderDetail] AS d 
GROUP BY SalesOrderID
HAVING  SalesOrderID =71885 

-- 4 mucho dinero en pedidios
SELECT SalesOrderID,  SUM(LineTotal) AS TotalPedido
FROM  [SalesLT].[SalesOrderDetail] AS d 
GROUP BY SalesOrderID
HAVING  SUM(LineTotal) > 50000 


