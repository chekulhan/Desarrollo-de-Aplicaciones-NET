CREATE TABLE oe.clientesImportantes(
	codCliente smallint NOT NULL,
	nombre varchar(20) NULL,
	ciudad varchar(30) NULL,
	numeroDePedidos smallint NULL,
	importeTotal decimal(10, 2) NULL,
	 CONSTRAINT PK_clientesImportantes PRIMARY KEY CLUSTERED 
	(
		[codCliente] ASC
	))
GO


