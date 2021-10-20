
SELECT [CMP].[ID]                   AS [Company_ID]
      ,[CMP].[Name]                 AS [Company_Name]
      ,[LGR].[AccountingCurrency]   AS [Accounting_Currency] -- Monetary Standard (MST)
      ,[LGR].[ReportingCurrency]    AS [Reporting_Currency]
  FROM [dbo].[Ledger] AS [LGR]

       INNER JOIN [dbo].[DataArea] AS [CMP]
               ON [CMP].[RecID] = [LGR].[PrimaryForLegalEntity]

 ORDER BY [CMP].[ID] ASC
      ,[CMP].[Name] ASC;

GO

