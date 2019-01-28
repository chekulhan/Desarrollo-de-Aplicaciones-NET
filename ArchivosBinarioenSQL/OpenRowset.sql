SELECT * FROM Fotos

/* Insert a new category with an image */

INSERT INTO Fotos(Foto)   
   SELECT * FROM OPENROWSET(BULK N'\\192.ZZZZZZ\diembre\archivontabilidad.jpg', SINGLE_BLOB) AS Foto;  