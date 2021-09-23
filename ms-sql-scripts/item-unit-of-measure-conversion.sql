
-- ITEM UNIT OF MEASURE CONVERSION
SELECT [ITM].[RecID]                                     AS [Item_Record_ID]
      ,[ITM].[DataAreaID]                                AS [Company_ID]

      ,NULLIF([ITM].[ItemID], '')                        AS [Item_Number]
      ,NULLIF([PRD].[SearchName], '')                    AS [Item_Search_Name]
      ,NULLIF([PRD_NME].[Name], '')                      AS [Item_Name]

      ,[UOM_FRM].[Symbol]                                AS [From_Unit_of_Measure]
      ,[UOM_TO].[Symbol]                                 AS [To_Unit_of_Measure]
      ,[UOM_CNV].[Factor]                                AS [Conversion_Factor]

  FROM [dbo].[InventTable] AS [ITM]

       -- PRODUCT LOOKUP
       LEFT JOIN [dbo].[EcoResProduct] AS [PRD]
              ON [PRD].[EcoResProductRecID] = [ITM].[Product]
             AND [PRD].[Partition]          = [ITM].[Partition]

       -- PRODUCT (NAME) LOOKUP
       LEFT JOIN [dbo].[EcoResProductTranslation] AS [PRD_NME]
              ON [PRD_NME].[Product]    = [ITM].[Product]
             AND [PRD_NME].[Partition]  = [ITM].[Partition]
             AND [PRD_NME].[LanguageID] = 'en-us'

       -- UNIT OF MEASURE CONVERSION LOOKUP
       LEFT JOIN [dbo].[UnitOfMeasureConversion] AS [UOM_CNV]
              ON [UOM_CNV].[Product]    = [ITM].[Product]
             AND [UOM_CNV].[Partition]  = [ITM].[Partition]

       -- UNIT OF MEASURE (FROM) LOOKUP
       LEFT JOIN [dbo].[UnitOfMeasure] AS [UOM_FRM]
              ON [UOM_FRM].[UnitOfMeasureRecID] = [UOM_CNV].[FromUnitOfMeasure]
             AND [UOM_FRM].[Partition]          = [UOM_CNV].[Partition]

       -- UNIT OF MEASURE (TO) LOOKUP
       LEFT JOIN [dbo].[UnitOfMeasure] AS [UOM_TO]
              ON [UOM_TO].[UnitOfMeasureRecID] = [UOM_CNV].[ToUnitOfMeasure]
             AND [UOM_TO].[Partition]          = [UOM_CNV].[Partition]

 ORDER BY [ITM].[DataAreaID] ASC
      ,[ITM].[ItemID] ASC

