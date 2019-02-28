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