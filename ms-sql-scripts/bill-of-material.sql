
-- Bill of Materials
SELECT [BOM_HDR].[DataAreaId]             AS [Company_ID]
      ,[BOM_HDR].[RecId]                  AS [Record_ID]

      ,[BOM_HDR].[BomId]                  AS [Bom_ID]
      ,[BOM_HDR].[Name]                   AS [Bom_Name]
      ,[BOM_HDR].[Approved]               AS [Bom_Approved]

      ,NULLIF([BOM_APP_NME].[Name], '')   AS [Bom_Approved_By]
      ,NULLIF([ITM_GRP].[Name], '')       AS [Item_Group]

  FROM [dbo].[BomTable] AS [BOM_HDR]

       -- BOM Approved By Lookup
       LEFT JOIN [dbo].[HcmWorker] AS [BOM_APP]
              ON [BOM_APP].[RecId]     = [BOM_HDR].[Approver]
             AND [BOM_APP].[Partition] = [BOM_HDR].[Partition]

       -- BOM Approved By (Name) Lookup
       LEFT JOIN [dbo].[DirPartyTable] AS [BOM_APP_NME]
              ON [BOM_APP_NME].[RecId]     = [BOM_APP].[Person]
             AND [BOM_APP_NME].[Partition] = [BOM_APP].[Partition]

       LEFT JOIN [dbo].[InventItemGroup] AS [ITM_GRP]
              ON [ITM_GRP].[ItemGroupId] = [BOM_HDR].[ItemGroupId]
             AND [ITM_GRP].[Partition]   = [BOM_HDR].[Partition]
             AND [ITM_GRP].[DataAreaId]  = [BOM_HDR].[DataAreaId];
             
GO

