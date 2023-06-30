



``` sql

SELECT [ITM].[DataAreaId]                                                    AS [CompanyID]

      ,CONVERT(BIGINT, [ITM].[RecId])                                        AS [ItemKey]

      ,[ITM].[ItemId]                                                        AS [ItemNumber]
      ,ISNULL([ITM_NME].[Name], '')                                          AS [ItemName]
      ,ISNULL([ITM].[ItemTypeLabel], '')                                     AS [ItemType]

      ,ISNULL([ITM_GRP_ITM].[ItemGroupId], '')                               AS [ItemGroupID]
      ,ISNULL([ITM_GRP].[Name], '')                                          AS [ItemGroupName]

      ,ISNULL([ITM].[ItemBuyerGroupId], '')                                  AS [ItemBuyerGroupID]
      ,ISNULL([ITM].[CostGroupId], '')                                       AS [CostGroupID]

  FROM [dbo].[InventTable] AS [ITM]

       LEFT JOIN [dbo].[EcoResProductTranslation] AS [ITM_NME]
              ON [ITM_NME].[Product] = [ITM].[Product]
       
       LEFT JOIN [dbo].[InventItemGroupItem] AS [ITM_GRP_ITM]
              ON [ITM_GRP_ITM].[ItemDataAreaId] = [ITM].[DataAreaId]
             AND [ITM_GRP_ITM].[ItemId] = [ITM].[ItemId]

       LEFT JOIN [dbo].[InventItemGroup] AS [ITM_GRP]
              ON [ITM_GRP].[DataAreaId]  = [ITM_GRP_ITM].[ItemGroupDataAreaId]
             AND [ITM_GRP].[ItemGroupId] = [ITM_GRP_ITM].[ItemGroupId];

```
