--server : 172.27.2.59\SQL2019
--login : training_user/Training@123
--Database : StackOverflow2010

--Create a unique table
Select * into dbo.Users_thoufiha from dbo.users;

--Add Primary key 
ALTER TABLE dbo.users_thoufiha ADD CONSTRAINT [PK_users_thoufiha_Id]
PRIMARY KEY CLUSTERED ([Id] ASC)

--Added detials in the messages tab
SELECT id 
FROM dbo.Users_thoufiha 

SET STATISTICS IO ON; 
GO

--To get the number of 8KB pages a table consists of and Logical reads
SELECT ID 
FROM dbo.Users_thoufiha  

--Adding Where condition
SELECT Id 
FROM dbo.Users_thoufiha 
WHERE LastAccessDate > '2014/07/01'; 

CREATE NONCLUSTERED INDEX 
[idx_Users_thoufiha_LastAccessDate] ON [dbo].[Users_thoufiha]
([LastAccessDate] ASC )

SELECT Id 
FROM dbo.Users_thoufiha 
WHERE LastAccessDate > '2014/07/01'; 

--Example for AboutMe column in JIVA
sp_help users_thoufiha

--Different Query Plans
DROP INDEX [idx_Users_thoufiha_LastAccessDate] ON [dbo].[Users_thoufiha]

SELECT Id 
FROM dbo.Users_thoufiha 
WHERE LastAccessDate > '2014/07/01'; 

sp_configure 'cost threshold', 50
 RECONFIGURE WITH OVERRIDE
GO

SELECT Id 
FROM dbo.Users_thoufiha 
WHERE LastAccessDate > '2014/07/01'; 

sp_configure 'cost threshold', 50
 RECONFIGURE WITH OVERRIDE
GO

SELECT Id 
FROM dbo.Users_thoufiha 
WHERE LastAccessDate > '2014/07/01';

--Adding an ORDER BY
SELECT Id  
  FROM dbo.Users_thoufiha  
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

CREATE NONCLUSTERED INDEX [idx_Users_thoufiha_LastAccessDate] 
ON [dbo].[Users_thoufiha]
([LastAccessDate] ASC )
									  
SELECT Id  
  FROM dbo.Users_thoufiha  
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

DROP INDEX [idx_Users_thoufiha_LastAccessDate] ON [dbo].[Users_thoufiha]

--The Perils of SELECT *
SELECT Id  
  FROM dbo.Users_thoufiha  
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

SELECT * 
  FROM dbo.Users_thoufiha  
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

--Running a Query Repeatedly
SET STATISTICS IO, TIME ON; 
GO 

SELECT Id 					
  FROM dbo.Users_thoufiha 
  WHERE LastAccessDate > '2014/07/01' 
  ORDER BY LastAccessDate; 
GO 10 

--Non-clustered index
SELECT Id 
 FROM dbo.Users_thoufiha 
 WHERE LastAccessDate > '2014/07/01'; 

CREATE NONCLUSTERED INDEX [idx_Users_thoufiha_LastAccessDate_ID] ON [dbo].[Users_thoufiha]
([LastAccessDate] ASC , ID ASC)

SELECT Id 
 FROM dbo.Users_thoufiha 
 WHERE LastAccessDate > '2014/07/01';

--seek vs scan
--seek reading full table
SELECT Id 
  FROM dbo.Users_thoufiha 
  WHERE LastAccessDate > '1800/01/01'; 

--Scan is better
SELECT TOP 10 * 
  FROM dbo.Users_thoufiha; 

--Key Lookup
SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users_thoufiha 
  WHERE LastAccessDate > '2018-09-02 04:00' 
  ORDER BY LastAccessDate; 

--cost of the key lookup
SELECT LastAccessDate, Id
  FROM dbo.Users_thoufiha 
  WHERE LastAccessDate > '2018-09-02 04:00' 
  ORDER BY LastAccessDate;

SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users_thoufiha 
  WHERE LastAccessDate > '2018-09-02 04:00' 
  ORDER BY LastAccessDate;

CREATE NONCLUSTERED INDEX [idx_Users_thoufiha_LastAccessDate_ID]
ON [dbo].[Users_thoufiha] ([LastAccessDate])
INCLUDE ([Age],[DisplayName])
WITH(DROP_EXISTING = ON);

 