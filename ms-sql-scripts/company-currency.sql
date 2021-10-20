
SELECT [CMP].[ID]                   AS [Company_ID]
      ,[CMP].[Name]                 AS [Company_Name]
      ,[LGR].[AccountingCurrency]   AS [Accounting_Currency]
      ,[LGR].[ReportingCurrency]    AS [Reporting_Currency]
  FROM [dbo].[Ledger] AS [LGR]

       INNER JOIN [dbo].[DataArea] AS [CMP]
               ON [CMP].[RecID] = [LGR].[PrimaryForLegalEntity]

 ORDER BY 1 ASC
      ,2 ASC;

GO
