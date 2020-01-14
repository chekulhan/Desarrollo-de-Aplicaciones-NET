-- SQL para hacer UNION y UNION ALL

Create Table tblMailingAddress
(
   AddressId int NOT NULL primary key,
   EmployeeNumber int,
   HouseNumber nvarchar(50),
   StreetAddress nvarchar(50),
   City nvarchar(10),
   PostalCode nvarchar(50)
)

Insert into tblMailingAddress values (1, 101, '#10', 'King Street', 'London', 'CR27DW')
Insert into tblMailingAddress values (2, 102, '#20', 'Paseo Colon ', 'Donosti', '20001')
Insert into tblMailingAddress values (3, 103, '#89', 'Calle Mayor ', 'Donosti', '20001')

Create Table tblPhysicalAddress
(
 AddressId int NOT NULL primary key,
 EmployeeNumber int,
 HouseNumber nvarchar(50),
 StreetAddress nvarchar(50),
 City nvarchar(10),
 PostalCode nvarchar(50)
)

Insert into tblPhysicalAddress values (100, 8, '#1078', 'Paseo de los Pinos', 'Bilbao', '30021')
Insert into tblPhysicalAddress values (101, 9, '#10', 'Calle Hernani', 'Donosti', '20085')
Insert into tblPhysicalAddress values (102, 10, '#10', 'Calle Zabaleta', 'Donosti', '20045')
Insert into tblPhysicalAddress values (103, 1, '#89', 'Calle Mayor ', 'Donosti', '20001')


