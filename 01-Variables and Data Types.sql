--------------------- 01 Comment ---------------------
------------------------------------------------------

-- Single Line Comment

/*
MultiLine
Comment
*/

-- Ctrl+K , Ctrl+C => Comment
-- Ctrl+K , Ctrl+U => Uncomment

--==================================================--

------------------- 02 Variables ---------------------
-- variables are used to temporarily store data during the execution of T-SQL (Transact-SQL) code

--1. System Functions (Built-in Global Variables)
--SQL Server provides special system variables (technically functions) that start with @@.
--| Variable / Function | Description                                    |
--| ------------------- | ---------------------------------------------- |
--| `@@VERSION`         | SQL Server version and OS info.                |
--| `@@SERVERNAME`      | Name of the SQL Server instance.               |
--| `@@LANGUAGE`        | Current language setting.                      |
--| `@@MAX_CONNECTIONS` | Max allowed connections.                       |
--| `@@ERROR`           | Last error number in the session.              |
--| `@@ROWCOUNT`        | Number of rows affected by the last statement. |
--| `@@TRANCOUNT`       | Number of open transactions in the session.    |
--| `@@IDENTITY`        | Last identity value generated in the session.  |


select @@Version as [Version]
select @@ServerName as [ServerName]



--2. Local Variables (User-Defind)
declare @name varchar(10) = 'Abdullah' 
declare @age int = 23
print @name
print @age

set @name = 'Hussein'
--Select @name = 'Ismail'
print @name


-- Naming Convention
--===================
--Pascal Case
print @@ServerName
--CamelCase
print @@serverName

--=====================================================
---------- Data Types -------------
--1. Exact Numeric Data Types
--Used for integers and fixed-precision numbers.
--| Data Type                       | Storage    | Range                                                   |
--| ------------------------------- | ---------- | ------------------------------------------------------- |
--| `bit`                           | 1 byte     | 0, 1, or NULL                                           |
--| `tinyint`                       | 1 byte     | 0 to 255                                                |
--| `smallint`                      | 2 bytes    | -32,768 to 32,767                                       |
--| `int`                           | 4 bytes    | -2,147,483,648 to 2,147,483,647                         |
--| `bigint`                        | 8 bytes    | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
--| `decimal(p,s)` / `numeric(p,s)` | 5–17 bytes | Fixed precision & scale (`p`=precision, `s`=scale)      |
--| `money`                         | 8 bytes    | -922,337,203,685,477.5808 to +922,337,203,685,477.5807  |
--| `smallmoney`                    | 4 bytes    | -214,748.3648 to +214,748.3647                          |

--2. Approximate Numeric Data Types
--Used for floating-point numbers.

--| Data Type  | Storage      | Range                               |
--| ---------- | ------------ | ----------------------------------- |
--| `float(n)` | 4 or 8 bytes | Very large/small approximate values |
--| `real`     | 4 bytes      | Approximate numeric values          |

--3. Date and Time Data Types
--| Data Type        | Storage    | Range / Precision                            |
--| ---------------- | ---------- | -------------------------------------------- |
--| `date`           | 3 bytes    | YYYY-MM-DD                                   |
--| `datetime`       | 8 bytes    | 1753-01-01 to 9999-12-31 (accuracy: 3.33 ms) |
--| `datetime2`      | 6–8 bytes  | 0001-01-01 to 9999-12-31 (higher precision)  |
--| `smalldatetime`  | 4 bytes    | 1900-01-01 to 2079-06-06 (accuracy: 1 min)   |
--| `time`           | 3–5 bytes  | 00:00:00.0000000 to 23:59:59.9999999         |
--| `datetimeoffset` | 8–10 bytes | Date + time zone offset                      |

--4. Character String Data Types
--| Data Type           | Storage                      | Notes                      |
--| ------------------- | ---------------------------- | -------------------------- |
--| `char(n)`           | Fixed length (n bytes)       | Max 8,000 chars            |
--| `varchar(n)`        | Variable length (n+2 bytes)  | Max 8,000 chars            |
--| `varchar(max)`      | Variable length (up to 2 GB) | Stores large text          |
--| `text` (deprecated) | Up to 2 GB                   | Use `varchar(max)` instead |

--5. Unicode Character String Data Types
--| Data Type            | Storage                       | Notes               |
--| -------------------- | ----------------------------- | ------------------- |
--| `nchar(n)`           | Fixed length (2×n bytes)      | Unicode             |
--| `nvarchar(n)`        | Variable length (2×n+2 bytes) | Unicode             |
--| `nvarchar(max)`      | Up to 1,073,741,823 chars     | Unicode large text  |
--| `ntext` (deprecated) | Large Unicode text            | Use `nvarchar(max)` |

 --6. Binary Data Types
--Binary data types in SQL Server are used to store raw byte data instead of readable text or numbers.

--You use them when you need to store things like:
--	Images (JPG, PNG, etc.)
--	Files (PDF, DOCX, etc.)
--	Encrypted data
--	Any non-text binary stream

--| Data Type            | Storage         | Notes                |
--| -------------------- | --------------- | -------------------- |
--| `binary(n)`          | Fixed length    | Up to 8,000 bytes    |
--| `varbinary(n)`       | Variable length | Up to 8,000 bytes    |
--| `varbinary(max)`     | Up to 2 GB      | Large binary data    |
--| `image` (deprecated) | Up to 2 GB      | Use `varbinary(max)` |
