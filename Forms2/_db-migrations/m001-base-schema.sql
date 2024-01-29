use master;
go

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TamJobPostings')
BEGIN
  CREATE DATABASE TamJobPostings;
END;
go

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

IF not EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[_schema_changelog]') AND type in (N'U'))
    create table _schema_changelog
(
    ChangeId INT PRIMARY KEY CLUSTERED,
    AppliedDateTime datetime not null default (getdate()),
    AppliedBy nvarchar(25) not null,
    Description nvarchar(100) not null
);
