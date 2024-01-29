use master;
go

IF NOT EXISTS (SELECT *
FROM sys.databases
WHERE name = 'TamJobPostings')
BEGIN
    CREATE DATABASE TamJobPostings;
END;

use TamJobPostings;
go

IF NOT EXISTS 
    (SELECT name
FROM master.sys.server_principals
WHERE name = 'tampostings')
BEGIN
    CREATE LOGIN tampostings WITH PASSWORD = 'Strong-Password.1234';
END

IF NOT EXISTS
    (SELECT name
FROM sys.database_principals
WHERE name = 'tampostings')
BEGIN
    CREATE USER [tampostings] FOR LOGIN [tampostings]
END

EXEC sp_addrolemember N'db_owner', N'tampostings';