-- funciones del sistema
SELECT SYSDATETIME()
SELECT GetDate()
SELECT SYSDATETIMEOFFSET()

-- *****************
DECLARE @f1 time = GetDate()
DECLARE @f2 date = GetDate()
DECLARE @f3 smalldatetime = GetDate()
DECLARE @f4 datetime = GetDate()
DECLARE @f5 datetime2 = GetDate()

DECLARE @f6 datetimeoffset = '12-10-2025 12:32:10 +03:00';

SELECT @f1 as time, @f2 as date, @f3 as smalldatetime,
	@f4 as datetime, @f5 as datetime2, @f6 as datetimeoffset

-- *****************

SELECT ISDATE(GetDate())
SELECT ISDATE('19/04/1987')
SELECT ISDATE('19 mayo 2010')


SELECT DATEPART(dw, GetDate())

SELECT DATENAME(dw, GetDate())

-- https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/
SELECT CONVERT(VARCHAR(50), GETDATE(), 110)
SELECT CONVERT(VARCHAR(50), GETDATE(), 8)
SELECT CONVERT(VARCHAR(50), GETDATE(), 0)