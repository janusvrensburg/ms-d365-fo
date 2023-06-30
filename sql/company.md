# Company (Data Area)

<br />

``` sql
SELECT [CMP].[Id]                                 AS [CompanyID]
      ,NULLIF([CMP].[Name], '')                   AS [CompanyName]
  FROM [dbo].[DataArea] AS [CMP]
```

<br />

## Currency Lookup (Ledger)

<br />

``` sql
SELECT [CMP].[Id]                                 AS [CompanyID]

      ,NULLIF([LGR].[AccountingCurrency], '')     AS [AccountingCurrency] -- Monetary Standard (MST)
      ,NULLIF([LGR].[ReportingCurrency], '')      AS [ReportingCurrency]

  FROM [dbo].[DataArea] AS [CMP]

       INNER JOIN [dbo].[Ledger] AS [LGR]
               ON [LGR].[PrimaryForLegalEntity] = [CMP].[RecId]
```

<br />
