
-- ITEM LIFECYCLE
SELECT [ITM].[DataAreaID]                    AS [Company_ID]

      ,[ITM].[RecID]                         AS [Item_Record_ID]

      ,[ITM].[ItemID]                        AS [Item_Number]
      ,NULLIF([PRD_NME].[Name], '')          AS [Item_Name]

      ,NULLIF([ITM_LFE].[Description], '')   AS [Item_Lifecycle_State]

  FROM [dbo].[InventTable] AS [ITM] -- ITEM

       -- PRODUCT (NAME) LOOKUP
       LEFT JOIN [dbo].[EcoResProductTranslation] AS [PRD_NME]
              ON [PRD_NME].[Product]    = [ITM].[Product]
             AND [PRD_NME].[Partition]  = [ITM].[Partition]
             AND [PRD_NME].[LanguageID] = 'en-us'

       -- ITEM LIFECYCLE STATE LOOKUP
       LEFT JOIN [dbo].[EcoResProductLifecycleState] AS [ITM_LFE] 
              ON [ITM_LFE].[StateID]     = [ITM].[ProductLifecycleStateID]
             AND [ITM_LFE].[Partition]   = [ITM].[Partition];

