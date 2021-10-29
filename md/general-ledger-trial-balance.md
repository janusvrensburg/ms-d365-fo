# General Ledger - Trial Balance

<br />

## SQL

<br />

```sql
SELECT [CMP].[Id]                                                 AS [Company_ID]
      ,[CMP].[Name]                                               AS [Company_Name]

      ,[LGR_ACC].[MainAccountId]                                  AS [Main_Account_ID]
      ,[LGR_ACC].[Name]                                           AS [Main_Account_Name]

      ,[CAL].[EndDate]                                            AS [Accounting_Date]

      ,SUM(CASE WHEN [GL_JRN_ACC].[IsCredit] = 0	
                THEN [GL_JRN_ACC].[ReportingCurrencyAmount]	
                ELSE NULL
                END)                                              AS [Debit_Amount]
	
      ,SUM(CASE WHEN [GL_JRN_ACC].[IsCredit] = 1	
                THEN (- [GL_JRN_ACC].[ReportingCurrencyAmount])	
                ELSE NULL
                END)                                              AS [Credit_Amount]

  FROM [dbo].[GeneralJournalEntry] AS [GL_JRN]

       INNER JOIN [dbo].[GeneralJournalAccountEntry] AS [GL_JRN_ACC]
               ON [GL_JRN_ACC].[GeneralJournalEntry] = [GL_JRN].[RecId]
              AND [GL_JRN_ACC].[Partition]           = [GL_JRN].[Partition]

       INNER JOIN [dbo].[MainAccount] AS [LGR_ACC]
               ON [LGR_ACC].[RecId]     = [GL_JRN_ACC].[MainAccount]
              AND [LGR_ACC].[Partition] = [GL_JRN_ACC].[Partition]

       INNER JOIN [dbo].[DataArea] AS [CMP]
               ON [CMP].[Id]        = [GL_JRN].[SubLedgerVoucherDataAreaId]
              AND [CMP].[Partition] = [GL_JRN].[Partition]

       INNER JOIN [dbo].[FiscalCalendarPeriod] AS [CAL]
               ON [CAL].[RECID]     = [GL_JRN].[FiscalCalendarPeriod]
              AND [CAL].[Partition] = [GL_JRN].[Partition]

 GROUP BY [CMP].[Id]
      ,[CMP].[Name]

      ,[LGR_ACC].[MainAccountId]
      ,[LGR_ACC].[Name]

      ,[CAL].[EndDate]

 ORDER BY [CMP].[Id] ASC
      ,[LGR_ACC].[MainAccountId] ASC
      ,[CAL].[EndDate] ASC;
```
