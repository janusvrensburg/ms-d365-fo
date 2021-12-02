
# Legal Entity vs Shared

``` SQL
SELECT DISTINCT [SCH].[name]                 AS [Table_Schema]
      ,[OBJ].[name]                          AS [Table_Name]

      ,(CASE WHEN [COL].[name] IS NOT NULL
             THEN 'Legal Entity Specific'
             ELSE 'Shared'
             END)                            AS [Table_Classification]

  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

       LEFT JOIN [sys].[columns] AS [COL]
              ON [COL].[object_id] = [OBJ].[object_id]
             AND [COL].[name] LIKE '%DataAreaId'

 WHERE [OBJ].[type] = 'U'
   AND [SCH].[name] LIKE '%dbo%'
   AND [OBJ].[name] LIKE 'Mca%'

 ORDER BY [SCH].[name] ASC
      ,[OBJ].[name] ASC;
```
