
SELECT [EMP].[RecID]                  AS [Employee_Record_ID]

      ,[EMP].[PersonnelNumber]        AS [Personnel_Number]

      ,NULLIF([EMP_NME].[Name], '')   AS [Full_Name]

  FROM [dbo].[HcmWorker] AS [EMP]

       LEFT JOIN [dbo].[DirPartyTable] AS [EMP_NME]
              ON [EMP_NME].[RecId]     = [EMP].[Person]
             AND [EMP_NME].[Partition] = [EMP].[Partition];
             
GO

