
SELECT [ITM_GRP].[DataAreaId]    AS [Company_ID]
      ,[ITM_GRP].[RecId]         AS [Record_ID]
      ,[ITM_GRP].[ItemGroupId]   AS [Item_Group_ID]
      ,[ITM_GRP].[Name]          AS [Item_Group]
  FROM [dbo].[InventItemGroup] AS [ITM_GRP];

GO

