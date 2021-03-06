
-- Vendor
SELECT [VND].[DataAreaID]                        AS [Company_ID]

      ,[VND].[RecID]                             AS [Vendor_Record_ID]
      ,NULLIF([VND].[AccountNum], '')            AS [Vendor_ID]
      ,NULLIF([VND_NME].[Name], '')              AS [Vendor_Name]

      ,NULLIF([VND].[VendGroup], '')             AS [Vendor_Group_ID]
      ,NULLIF([VND_GRP].[Name], '')              AS [Vendor_Group_Name]

      ,NULLIF([VND].[PaymTermID], '')            AS [Payment_Term_ID]
      ,NULLIF([VND_PAY_TRM].[Description], '')   AS [Payment_Term_Name]

      ,NULLIF([VND].[DlvTerm], '')               AS [Delivery_Term_ID]
      ,NULLIF([VND_DEL_TRM].[TXT], '')           AS [Delivery_Term_Name]

  FROM [dbo].[VendTable] AS [VND] -- Vendor

       -- Vendor (Name) Lookup
       LEFT JOIN [dbo].[DirPartyTable] AS [VND_NME]
              ON [VND_NME].[RecID]     = [VND].[Party]
             AND [VND_NME].[Partition] = [VND].[Partition]
       
       -- Vendor Group Lookup
       LEFT JOIN [dbo].[VendGroup] AS [VND_GRP]
              ON [VND_GRP].[VendGroup]  = [VND].[VendGroup]
             AND [VND_GRP].[Partition]  = [VND].[Partition]
             AND [VND_GRP].[DataAreaID] = [VND].[DataAreaID]

       -- Vendor Payment Term Lookup
       LEFT JOIN [dbo].[PaymTerm] AS [VND_PAY_TRM]
              ON [VND_PAY_TRM].[PaymTermID] = [VND].[PaymTermID]
             AND [VND_PAY_TRM].[Partition]  = [VND].[Partition]
             AND [VND_PAY_TRM].[DataAreaID] = [VND].[DataAreaID]

       -- Vendor Delivery Term Lookup
       LEFT JOIN [dbo].[DlvTerm] AS [VND_DEL_TRM]
              ON [VND_DEL_TRM].[Code]       = [VND].[DlvTerm]
             AND [VND_DEL_TRM].[Partition]  = [VND].[Partition]
             AND [VND_DEL_TRM].[DataAreaID] = [VND].[DataAreaID]

