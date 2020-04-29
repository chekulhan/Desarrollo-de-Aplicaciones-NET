
-- plantas (ENTENDER bien el contexto)
-- https://www.guiaverde.com/guia-de-plantas/

-- UNION operador:
-- https://www.w3schools.com/sql/sql_union.asp


CREATE TABLE plantas_exoticas (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NombreComun varchar(200) NOT NULL,
    NombreLatin varchar(200) NOT NULL,
    Tipo varchar(8000) NOT NULL,
    Descripcion varchar(MAX),
    Foto varbinary(MAX)
)

-- varbinary = MAX indicates that the maximum storage size is 2^31-1 bytes (2 GB)
DECLARE @descripcion varchar(MAX)

-- 2 formas de separar contentido CHAR(13) y <BR> - los resultados en TEXTO, no GRID

SET @descripcion = 'Árbol caducifolio nativo de origen ornamental. Alcanza una altura de unos 4-6 m. Sus hojas son simples, elípticas y con bordes dentados de color negro púrpura ligeramente pequeñas y caducas. La copa es de forma redondeada y algo desordenada con multitud de ramas.'
SET @descripcion = @descripcion + CHAR(13) + 'La floración se produce en primavera, antes que las hojas, típicas de la familia de las rosáceas con pétalos grandes y de color rosa pálido.'
SET @descripcion = @descripcion + CHAR(13) + 'Los frutos aparecen tras la floración dando lugar a frutos carnosos de color oscuro. Las semillas son grandes y huesudas.'

INSERT INTO plantas_exoticas (NombreComun, NombreLatin, Tipo, Descripcion)
VALUES ('Ciruelo rojo', 'Prunus cerasifera Nigra', 'Árbol ornamental', @descripcion)


SET @descripcion = 'Árbol ó arbusto caducifolio del monte bajo del sudeste de EE.UU.de unos 5-6 m de altura utilizada por su floración. Sus hojas compuestas poseen de 12 a 15 foliolos ovales acabadas en mucrón (punta corta terminal de las hojas) de color verdes claro. Los tallos están cubiertos densamente de cerdas marrones.'
SET @descripcion = @descripcion + '<br>La floración se produce en primavera, apareciendo en grandes racimos colgantes de flores que aparecen en los extremos de las ramas de color rosado. Las flores son rosas con un gran estandarte de dos centímetros.'
SET @descripcion = @descripcion + '<br>Los frutos aparecen tras la floración dando lugar a grandes cantidades de vainas marrones seminales hirsutas de 8 cm de largo.'

INSERT INTO plantas_exoticas (NombreComun, NombreLatin, Tipo, Descripcion)
VALUES ('Acacia rosada', 'Robinia hispida', 'Árbol ornamental', @descripcion)


CREATE TABLE plantas_medicinales (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NombreComun varchar(200) NOT NULL,
    NombreLatin varchar(200) NOT NULL,
    Tipo varchar(8000) NOT NULL,
    Descripcion varchar(MAX),
    Foto varbinary(MAX)
)

-- 2 formas de separar contentido CHAR(13) y <BR> - los resultados en TEXTO, no GRID
SET @descripcion = 'Tronco rugoso y muy agrietado. Las ramas jóvenes poseen espinas, y las hojas adoptan posturas caídas durante la noche. Flores en racimos péndulos de color blanco, olorosas y melíferas.'

INSERT INTO plantas_medicinales (NombreComun, NombreLatin, Tipo, Descripcion)
VALUES ('Acacia de flor blanca', 'Robinia pseudoacacia', 'Árbol ornamental', @descripcion)

-- 2 formas de separar contentido CHAR(13) y <BR> - los resultados en TEXTO, no GRID
SET @descripcion = 'Floración blanco crema y follaje verde claro.'

INSERT INTO plantas_medicinales (NombreComun, NombreLatin, Tipo, Descripcion)
VALUES ('Annabelle', 'Hydrangea arborescens', 'Arbusto ornamental', @descripcion)

-- Esta planta es exotica y medicinal
SET @descripcion = 'Árbol ó arbusto caducifolio del monte bajo del sudeste de EE.UU.de unos 5-6 m de altura utilizada por su floración. Sus hojas compuestas poseen de 12 a 15 foliolos ovales acabadas en mucrón (punta corta terminal de las hojas) de color verdes claro. Los tallos están cubiertos densamente de cerdas marrones.'
SET @descripcion = @descripcion + '<br>La floración se produce en primavera, apareciendo en grandes racimos colgantes de flores que aparecen en los extremos de las ramas de color rosado. Las flores son rosas con un gran estandarte de dos centímetros.'
SET @descripcion = @descripcion + '<br>Los frutos aparecen tras la floración dando lugar a grandes cantidades de vainas marrones seminales hirsutas de 8 cm de largo.'

INSERT INTO plantas_medicinales (NombreComun, NombreLatin, Tipo, Descripcion)
VALUES ('Acacia rosada', 'Robinia hispida', 'Árbol ornamental', @descripcion)

/*

-- ACTIVIDAD: 
1. Insertar esta planta en la tabla plantas_medicinales - https://www.guiaverde.com/guia-de-plantas/adenium-obesum-3021/
2. Sacar una consulta para mostrar todos los nombres comunes  (NombreComun) de las dos tablas, sin repeticiones (UNION)

Avanzado:
3. Si introducimos una descripcion con muchos, mucho datos, para que el máximo tamaño de la fila sobrepasa 8,000 KB, como podemos VER si los datos estan en la misma página o una página OVERFLOW
PISTA: lo que hice en la última videoconferencia - http://www.guillesql.es/Articulos/DBCC_IND_DBCC_PAGE_Paginas_Tabla_Indice_SQLServer.aspx

*/
