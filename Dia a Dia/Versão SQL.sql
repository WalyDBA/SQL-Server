-- Este script me é útil para sempre manter uma organização dos ambientes em que administramos;
-- Tendo em vista que temos diversas instâncias, podemos utilizar do recurso "Registered Servers" para conectar as instâncias;
-- Esse script nos permite realizar um levantamento da versão e em qual CU/SP está atualizada.

SELECT DISTINCT
    SERVERPROPERTY('ProductVersion') AS ProductVersion,
    SERVERPROPERTY('ProductLevel') AS ProductLevel,
    SERVERPROPERTY('Edition') AS Edition,
    SERVERPROPERTY('EngineEdition') AS EngineEdition,
    SERVERPROPERTY('ProductMajorVersion') AS ProductMajorVersion,
    SERVERPROPERTY('ProductUpdateLevel') AS ProductUpdateLevel,
    SERVERPROPERTY('ProductUpdateReference') AS ProductUpdateReference
FROM 
    sys.dm_server_services
WHERE 
    SERVERPROPERTY('ProductMajorVersion') = '15';

-- Se o levantamento necessário for para versões diferentes do SQL, temos a seguinte relação:

    --SQL Server 2005: 9
    --SQL Server 2008: 10
    --SQL Server 2008 R2: 10
    --SQL Server 2012: 11
    --SQL Server 2014: 12
    --SQL Server 2016: 13
    --SQL Server 2017: 14
    --SQL Server 2019: 15
    --SQL Server 2022: 16
