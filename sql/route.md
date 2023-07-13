<!---------------------->
<!--- Page / Section --->
<!---------------------->

# Route

<br />

```
SELECT [RTE].[DataAreaId]
      ,[RTE].[RouteId]

      ,[RTE].[OprId]
      ,[RTE].[OprNum]

      ,[DOC].[TypeId]
      ,[DOC].[Name]
      ,[DOC].[CreatedBy]
      ,CAST([DOC].[CreatedDateTime] AT TIME ZONE 'UTC' AT TIME ZONE 'Central Standard Time' AS DATETIME) AS [CreatedDateTime]

  FROM [dbo].[Route] AS [RTE]

       LEFT JOIN [dbo].[RouteOpr] AS [RTE_OPR]
              ON [RTE_OPR].[DataAreaId] = [RTE].[DataAreaId]
             AND [RTE_OPR].[RouteRelation] = [RTE].[RouteId]
             AND [RTE_OPR].[OprId] = [RTE].[OprId]

       LEFT JOIN [dbo].[DocuRef] AS [DOC]
              ON [DOC].[RefRecId] = [RTE_OPR].[RecId]
```

<br />

<!---------------------->
<!--- Page / Section --->
<!---------------------->
