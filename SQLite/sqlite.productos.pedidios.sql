/*
SQLite es un sistema de gestión de base de datos relacional,  contenida en una biblioteca muy pequeña, escrita en C.

A diferencia de los sistemas de gestion de bases de datos cliente-servidor,  SQLite no es un proceso independiente con el que el programa principal se comunica. En lugar de eso, la biblioteca SQLite se enlaza con el programa pasando a ser parte integral del mismo.

Esta es una muy buena opción cuando necesitamos programar aplicaciones pequeña y que manejen base de datos.

*/

CREATE TABLE Productos(
	ProductoID INTEGER NOT NULL PRIMARY KEY,
	Nombre TEXT(50) NULL
 );

CREATE TABLE Pedidos(
	ID INTEGER NOT NULL PRIMARY KEY,
	PedidoID INTEGER NULL,
	PreciodeUnidad real NULL,
	Cantidad INTEGER NULL,
	ProductoID INTEGER NULL,

FOREIGN KEY (ProductoID)
       REFERENCES Productos (ProductoID) 
 );




INSERT INTO Productos (ProductoID, Nombre) VALUES (1, 'Bicicleta');
INSERT INTO Productos (ProductoID, Nombre) VALUES (2, 'Botella de agua');
INSERT INTO Productos (ProductoID, Nombre) VALUES (3, 'Camiseta');
INSERT INTO Productos (ProductoID, Nombre) VALUES (4, 'Paella');


INSERT INTO Pedidos (ID, PedidoID, PreciodeUnidad, Cantidad, ProductoID) 
VALUES (1, 532, 300, 1, 1);

INSERT INTO Pedidos (ID, PedidoID, PreciodeUnidad, Cantidad, ProductoID) 
VALUES (2, 532, 2000, 2, 3);

INSERT INTO Pedidos (ID, PedidoID, PreciodeUnidad, Cantidad, ProductoID) 
VALUES (3, 276, 5300, 2, 1);

INSERT INTO Pedidos (ID, PedidoID, PreciodeUnidad, Cantidad, ProductoID) 
VALUES (4, 956, 30, 200, 1);
