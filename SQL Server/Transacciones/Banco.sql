-- Simulacion de una cuent bancaria

USE DevDB1;
GO


CREATE TABLE trans.Cuentas (
    IDCuenta int,
    Nombre varchar(255),
    Saldo float CHECK (Saldo>=0)
);

INSERT INTO trans.Cuentas (IDCuenta, Nombre, Saldo)
VALUES (1, 'Jon', 200)

INSERT INTO trans.Cuentas (IDCuenta, Nombre, Saldo)
VALUES (2, 'Maria', 100)

INSERT INTO trans.Cuentas (IDCuenta, Nombre, Saldo)
VALUES (3, 'Fernando', 3000)

SELECT * FROM trans.Cuentas

/* Llevar a cabo las siguientes transacciones en una cuenta DEBITO
Tener en cuenta de que las cuentas DEBITOS no pueden tener un saldo inferior a 0

1. Jon ingresa 50 euros en la cuenta de Maria
2. Fernando ingresa 200 euros en la cuenta de Maria
3. Fernando ingresa 3000 euros en la cuenta de Jon
*/

-- Respuestas
BEGIN TRANSACTION

BEGIN TRY
    UPDATE trans.Cuentas
    SET Saldo = Saldo - 3000
    WHERE IDCuenta = 3


    UPDATE trans.Cuentas
    SET Saldo = Saldo + 3000
    WHERE IDCuenta = 2

   
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    PRINT 'Error'
    ROLLBACK TRANSACTION
END CATCH