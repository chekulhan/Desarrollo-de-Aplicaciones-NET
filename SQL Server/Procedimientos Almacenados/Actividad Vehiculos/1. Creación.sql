use XXXX DATABASE
go 
CREATE SCHEMA TRANSPORTES
GO

CREATE TABLE [Transportes].[Vehiculos](
	[IDVehiculo] [smallint] NOT NULL,
	[CapacidaTransporteT] [int] NULL,
	[Marca] [varchar](20) NOT NULL,
	[CapacidadDepositoL] [smallint] NULL,
	[ITV] [date] NULL,
	[Disponible] [char](2) NOT NULL,
	[FechaCompra] [date] NOT NULL,
	[CosteVehiculo] [money] NOT NULL,
	[VidaUtilKm] [int] NULL,
	[KmRecorridos] [int] NULL,
	[Matricula] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[IDVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




